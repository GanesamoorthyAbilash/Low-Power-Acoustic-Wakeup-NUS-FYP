// Reference Programs:
//https://github.com/SiliconLabs/peripheral_examples/tree/master/series2/iadc/iadc_scan_iadc_timer
//Drivers from Simplicity Studio 5 gecko SDK 4.4.1
//PG28 Pro Kit Example Project ==> Platform - I/O Stream USART Bare-metal

#include <app_peripherals.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include "em_gpio.h"
#include "em_cmu.h"



// LED0 output for program speed checking
#define GPIO_OUTPUT_0_PORT        gpioPortC
#define GPIO_OUTPUT_0_PIN         10

// LED1 output for indicating key signal detected
#define GPIO_OUTPUT_1_PORT        gpioPortC
#define GPIO_OUTPUT_1_PIN         11

//Adjusting HFRCO clock to 80MHz for fast processing
#define HFRCODPLL_FREQ            cmuHFRCODPLLFreq_80M0Hz

//Defining Sampling parameters
#define NUM_SAMPLES               2048
#define TOTAL_SAMPLES               10240

//Buffers to store IADC results. 2 for Pingpong method
uint16_t singleBuffer[TOTAL_SAMPLES];
uint16_t secondBuffer[TOTAL_SAMPLES];

//Match Filter Key Wave
int16_t key_wave[256] = {-1,0,1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0};

//Calibration value for Recalibration
uint32_t Scale = 2110431843;

//Declaring necessary variables
int count = 0;
int flag1 = 0;
int flag2 = 0;
int n,k;
int max_n = 10240;
int max_k = 256;

// Initialising the necessary peripherals
void app_init(void)
{
  // Initialising the LED
  initGPIO();

  //Setting system to a high clock for faster processing
  CMU_HFRCODPLLBandSet(HFRCODPLL_FREQ);
  CMU_ClockSelectSet(cmuClock_SYSCLK, cmuSelect_HFRCODPLL);

  //Initialising the necessary functions for IADC and LDMA
  initIADC();
  IADCRescale(Scale);
  initLDMA(singleBuffer,NUM_SAMPLES);
}

void addcount(void){

  count++;
  //Loop to collect 10240 samples in first buffer
  if (count<=4)
    {
    initLDMA(&singleBuffer[NUM_SAMPLES*count], NUM_SAMPLES);
    return;
    }
  //Flag to start match filter for first buffer
  else if (count==5)
    {
     flag1 = 1;

     return;
    }
  //Loop to collect 10240 samples in second buffer
  else if (count > 5 && count <= 9)
    {
    initLDMA(&secondBuffer[NUM_SAMPLES*(count-5)], NUM_SAMPLES);
    return;
    }
  //Flag to start match filter for second buffer
  else if (count==10)
    {
      flag2 = 1;
      //Reset count for next loop
      count =0;
      return;
    }
}


void app_process_action(void)
{
  if(flag1 == 1)
    {
      //Toggles LED to indicate the start of back to back 20480 samples collection and match filtering
      GPIO_PinOutToggle(GPIO_OUTPUT_0_PORT,GPIO_OUTPUT_0_PIN);
      //To start collecting the next set of samples while processing the current collected samples
      initLDMA(secondBuffer, NUM_SAMPLES);

      //Match Filter
      for (n = 0; n < max_n; n++) {
          int loopsum = 0;
        for (k = 0; k < max_k; k++) {
            int index = n-k;
            if (index>=0){
               loopsum += key_wave[k] * ((singleBuffer[index] >> 4) & 0x0FF);
            }
        }
        //If exceeds threshold of Matchfilter, then it is the key signal
        // 3000 is the threshold for 64bit keywave, 2.5v to 0.5v, obtained from experimentation
        if (loopsum>3000)
          {
            GPIO_PinOutSet(GPIO_OUTPUT_1_PORT,GPIO_OUTPUT_1_PIN);
          }
      }
      //Clearing LED1 for checking threshold in next loop
      GPIO_PinOutClear(GPIO_OUTPUT_1_PORT,GPIO_OUTPUT_1_PIN);
      //Flag to indicate match filtering of first buffer is done
      flag1=0;
    }
  else if(flag2 == 1)
    {
      //To start collecting the next set of samples while processing the current collected samples
      initLDMA(singleBuffer, NUM_SAMPLES);

      //Match Filter
      for (n = 0; n < max_n; n++) {
          int loopsum = 0;
        for (k = 0; k < max_k; k++) {
            int index = n-k;
            if (index>=0){
               loopsum += key_wave[k] * ((secondBuffer[index] >> 4) & 0x0FF);
            }
        }
        //If exceeds threshold of Matchfilter, then it is the key signal
        // 3000 is the threshold for 64bit keywave, 2.5v to 0.5v, obtained from experimentation
        if (loopsum>3000)
          {
            GPIO_PinOutSet(GPIO_OUTPUT_1_PORT,GPIO_OUTPUT_1_PIN);
          }
      }
      //Clearing LED1 for checking threshold in next loop
      GPIO_PinOutClear(GPIO_OUTPUT_1_PORT,GPIO_OUTPUT_1_PIN);
      //Flag to indicate match filtering of second buffer is done
      flag2=0;
    }
}
