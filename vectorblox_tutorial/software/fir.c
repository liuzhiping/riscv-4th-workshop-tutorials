#include  <stdint.h>

#include "printf.h"

#define I2S_DATA      ((volatile int*) (0x50000008))
#define SPEAKER_DATA  ((volatile int*) (0x70000008))





// FILTER CODE

#define USE_SCALAR_FILTER 1

#define NTAPS 64		// NTAPS must be power of 2

static int16_t filter_taps[NTAPS] = {
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

static int16_t buf[NTAPS];
static int idx;

void filter_init() {
	for( idx=0; idx < NTAPS; idx++ ) {
		buf[idx] = 0;
	}
	idx = 0;
}

void filter_put( int16_t sample ) {
	buf[idx] = sample;
	idx = (idx+1) & (NTAPS-1); // NTAPS must be power of 2
}

int filter_get( int16_t *buf ) {
	long long acc = 0;
	int i, index;
	for( i=0, index=idx; i < NTAPS; i++ ) {
		const int sample = (int) buf[ (index--) & (NTAPS-1) ];
		const int tap    = (int) filter_taps[i];
		acc += (long long) (sample*tap);
	};
	return acc >> 16;
}



// SOUND SAMPLE RECORD AND PLAYBACK

void record( int16_t *sample )
{
	int16_t left, rght;
	uint32_t i2s_data = *I2S_DATA; // blocking read
	left = ((int16_t) ((i2s_data >> 16    ) & 0xFFFF)) >> 2;
	rght = ((int16_t) ( i2s_data & 0xFFFF)) >> 2; 
	*sample = left + rght;
}

void play( int16_t sample )
{
	uint32_t data = (((uint32_t)sample) << 16) | ((uint32_t)sample);
	*SPEAKER_DATA = data; // blocking write
}


int sound_filter_test()
{

	//init_printf(0, mputc);
	//printf("Test\r\n");

	filter_init();

	while(1) {
		int16_t sample;
		record( &sample );
#if USE_SCALAR_FILTER
		filter_put( sample );
		sample = filter_get( buf );
#endif
		play( sample );
	}

	return 1;
}

