#include "printf.h"
#include "spi.h"
#include "flash.h"
#include "arrow_zl380tw.h"
#include "arrow_zl380tw_firmware.h"
#include "arrow_zl380tw_config.h"
#include "main.h"

#define IRAM_TEST 1
#define SPAD_TEST 1
#define SPI_TEST 1
#define I2S_TEST 1
#define FLASH_TEST 0
#define UART_TEST 1
#define MXP_TEST 1

static int array[8] = {'0', '1', '2', '3', '4', '5', '6', '7'};


//////////////////////
//
// UART stuff
//////////////////////
#define UART_BASE  ((volatile int*) (0x30000000))
#define UART_DATA UART_BASE
#define UART_LSR   ((volatile int*) (0x30000010))

//#define UART_INIT() do{*UART_LCR = UART_LCR_8BIT_DEFAULT;}while(0)
#define UART_PUTC(c) do{*UART_DATA = (c);}while(0)
#define UART_BUSY() (!((*UART_LSR) & 0x01))
void mputc (void* p, char c)
{
  delayms(1);
	while(UART_BUSY());
	*UART_DATA = c;
}

#define DRAM1 ((volatile int*) (0x10000100))
#define DRAM2 ((volatile int*) (0x10000200))
#define I2S           ((volatile int*) (0x50000000))
#define I2S_VERSION   ((volatile int*) (0x50000000))
#define I2S_CLOCK_DIV ((volatile int*) (0x50000004))
#define I2S_DATA      ((volatile int*) (0x50000008))
#define SPEAKER           ((volatile int*) (0x70000000))
#define SPEAKER_VERSION   ((volatile int*) (0x70000000))
#define SPEAKER_CLOCK_DIV ((volatile int*) (0x70000004))
#define SPEAKER_DATA      ((volatile int*) (0x70000008))

int main(void)
{
  volatile register uint32_t test asm ("a5");
  volatile int *address1 = DRAM1;
  volatile int *address2 = DRAM2;
  volatile int i2s_read;
  volatile int *flash_data;
  volatile int temp; 
  int i;

  // Test DPRAM and printf
  init_printf(0, mputc);
  //printf("Test\r\n");

#if FLASH_TEST
// Test Flash Memory
  flash_data = FLASH_ENDRAM;
  for(i = 0; i < 100; i++) {
    asm volatile("mv %0,sp" :"=r"(temp) :); 
    printf("sp : %0x ", temp);
    printf("%0x : ", (int)flash_data);
    temp = *(flash_data++);
    printf("%0x", temp);
    printf("\r\n");
  }
#endif

// Test SPI
#if SPI_TEST
  uint16_t read_data[1];
  uint16_t write_data[1];

  // Chip takes 3 ms to boot after reset.
  delayms(3);
  // Initialize the chip with firmware and config. 
  zl380tw_init();
  zl380tw_configure_codec(ZL380TW_STEREO_BYPASS);
  zl380tw_hbi_mwords_rd(0x2B0, read_data, 1);
  printf("Microphones before: %0x\r\n", read_data[0]);
  write_data[0] = 0x0003;
  zl380tw_hbi_mwords_wr(0x2B0, write_data, 1);  

  zl380tw_reset(VPROC_RST_SOFTWARE);
  zl380tw_hbi_mwords_rd(0x2B0, read_data, 1);
  printf("Microphones after: %0x\r\n", read_data[0]);

  zl380tw_hbi_mwords_rd(ZL380TW_PRODUCT_CODE_REG, read_data, 1);
  printf("PRODUCT CODE: %0x\r\n", read_data[0]);

  int16_t max_left = 0;
  int16_t max_right = 0;
  int16_t temp_left, temp_right;
  uint32_t i2s_data;

  while(0) {
    i2s_data = *I2S_DATA;
    
    // data shifted left in hardware
    temp_left = ((int16_t) ((i2s_data >> 16) & 0xFFFF)) >> 2;
    temp_right = ((int16_t) (i2s_data & 0xFFFF)) >> 2; 
    
    *SPEAKER_DATA = (((uint32_t)temp_left) << 16) | ((uint32_t)temp_right);
  
//    
//        
//    if (temp_left > max_left) {
//      max_left = temp_left;
//    }
//    printf("%0x ", max_left);
//    printf("%0x\r\n", max_right);
  }
#endif

#if I2S_TEST
#define SAMPLE_RATE 8000
#define TONE_FREQ 600

// Test I2S
  printf("I2S Test\r\n");
  while(0) {
    for(i = 0; i < (SAMPLE_RATE/TONE_FREQ); i++) {
      *SPEAKER_DATA = 0x3000;
    }
    for(i = 0; i < (SAMPLE_RATE/TONE_FREQ); i++) {
      *SPEAKER_DATA = (~(0x3000)) + 1;
    }
  }

  for(i = 0; i < 160000; i++)  {
    *SPEAKER_DATA = *I2S_DATA; 
  }
#endif

#if IRAM_TEST 
// Test IRAM reads
  for (i = 0; i < 8; i++) {
    UART_PUTC((char)array[i]);
  }
  UART_PUTC('\r');
  UART_PUTC('\n');
  delayms(1000);
#endif

#if UART_TEST
// Test UART
  char c;
  for (c = 'A'; c <= 'z'; c++) {
    UART_PUTC(c);
    delayms(100);
  }
#endif

#if MXP_TEST
  printf("\r\n\n\n----MXP TEST----\r\n\n\n");
  int errors = mxp_test();
  printf("MXP errors: %d\r\n", errors);
  printf("\r\n\n\n----END MXP TEST----\r\n\n\n");
#endif

#if SPAD_TEST
// Test data mem and LEDs 
  *address1 = 'A';
  *address2 = 'B';

  address1 = DRAM1;
  while(1) {
    *address1+=1;
    *address2+=1;
    test = *address1;
    asm volatile("csrw mtohost,%0"
      :
      :"r" (test));
    UART_PUTC((char)(*address1));
    delayms(1000);
    
    test = *address2;
    asm volatile("csrw mtohost,%0"
      :
      :"r" (test));
    UART_PUTC((char)(*address2));
    delayms(1000);
  }
#endif

  return 1;
}


int handle_trap(long cause,long epc, long regs[32])
{
	//spin forever
	for(;;);
}
