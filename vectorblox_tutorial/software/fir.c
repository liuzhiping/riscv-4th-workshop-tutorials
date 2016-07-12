#include  <stdint.h>

#include "printf.h"

#define I2S_DATA      ((volatile int*) (0x50000008))
#define SPEAKER_DATA  ((volatile int*) (0x70000008))





// FILTER CODE

#define USE_SCALAR_FILTER 1

#define NTAPS 64		// NTAPS must be power of 2

static int filter_taps[NTAPS] = {
  -11,
  9,
  46,
  100,
  143,
  136,
  55,
  -88,
  -227,
  -273,
  -159,
  99,
  384,
  521,
  369,
  -68,
  -600,
  -915,
  -743,
  -44,
  901,
  1567,
  1438,
  331,
  -1395,
  -2872,
  -3050,
  -1186,
  2723,
  7806,
  12563,
  15435,
  15435,
  12563,
  7806,
  2723,
  -1186,
  -3050,
  -2872,
  -1395,
  331,
  1438,
  1567,
  901,
  -44,
  -743,
  -915,
  -600,
  -68,
  369,
  521,
  384,
  99,
  -159,
  -273,
  -227,
  -88,
  55,
  136,
  143,
  100,
  46,
  9,
  -11
};

static int16_t lbuf[NTAPS];
static int16_t rbuf[NTAPS];
static int lr;

void filter_init() {
	for( lr=0; lr < NTAPS; lr++ ) {
		lbuf[lr] = rbuf[lr] = 0;
	}
	lr = 0;
}

void filter_put( int16_t lsound, int16_t rsound ) {
	lbuf[lr] = lsound;
	rbuf[lr] = rsound;
	lr = (lr+1) & (NTAPS-1); // NTAPS must be power of 2
}



// SOUND SAMPLE RECORD AND PLAYBACK

void record( int16_t *lsound, int16_t *rsound )
{
	uint32_t i2s_data = *I2S_DATA; // blocking read
	*lsound = ((int16_t) ((i2s_data >> 16    ) & 0xFFFF)) >> 2;
	*rsound = ((int16_t) ( i2s_data & 0xFFFF)) >> 2; 
}

void play( int16_t lsound, int16_t rsound )
{
	uint32_t data = (((uint32_t)lsound) << 16) | ((uint32_t)rsound);
	*SPEAKER_DATA = data; // blocking write
}

int filter_get( int16_t *buf ) {
	long long acc = 0;
	int index = lr;
	int i;
	for( i=0; i < NTAPS; i++ ) {
		acc += (long long)buf[(index--) & 63] * filter_taps[i];
	};
	return acc >> 16;
}


int sound_filter_test(void)
{

	//init_printf(0, mputc);
	//printf("Test\r\n");

	filter_init();

	while(1) {
		int16_t lsound, rsound;
		record( &lsound, &rsound );
#if USE_SCALAR_FILTER
		filter_put( lsound, rsound );
		lsound = filter_get( lbuf );
		rsound = filter_get( rbuf );
#endif
		play( lsound, rsound );
	}

	return 1;
}

