#include "printf.h"
#include "spi.h"
#include "flash.h"
#include "arrow_zl380tw.h"
#include "arrow_zl380tw_firmware.h"
#include "arrow_zl380tw_config.h"
#include "main.h"

#define SIMULATION 0
#define IRAM_TEST 1
#define SPAD_TEST 1
#define SPI_TEST 1
#define I2S_TEST 1
#define FLASH_TEST 1
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


int sound_filter_test(void);

int main(void)
{

  // Test DPRAM and printf
  init_printf(0, mputc);
  printf("Hello World\r\n");


// Test SPI
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


#define SAMPLE_RATE 8000
#define TONE_FREQ 600
#define MAX_VOLUME 0x7FF0
#define SECTION_LENGTH (SAMPLE_RATE/TONE_FREQ/2)


  printf("Microphone Direct to Speaker 10s\r\n");
  int i=0;
  while(++i<SAMPLE_RATE*10) {
    *SPEAKER_DATA = *I2S_DATA;
  }
  printf("running fir filter\r\n");
  sound_filter_test();
  return 1;
}


int handle_trap(long cause,long epc, long regs[32])
{
	//spin forever
	for(;;);
}
