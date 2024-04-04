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
#include "bsp_trace.h"


//For Energy Profile function tracing
#define       PORTIO_GPIO_SWV_PIN                                 3
#define       PORTIO_GPIO_SWV_PORT                                gpioPortA
#define       PORTIO_GPIO_SWV_LOC                                 0

#define       BSP_TRACE_SWO_PIN                                   3
#define       BSP_TRACE_SWO_PORT                                  gpioPortA
#define       BSP_TRACE_SWO_LOC                                   0

// LED0 output for program speed checking
#define GPIO_OUTPUT_0_PORT        gpioPortC
#define GPIO_OUTPUT_0_PIN         10

// LED1 output for indicating key signal detected
#define GPIO_OUTPUT_1_PORT        gpioPortC
#define GPIO_OUTPUT_1_PIN         11

//Defining Sampling parameters
#define NUM_SAMPLES               2048
#define TOTAL_SAMPLES               10240

//Buffers to store IADC results
uint16_t singleBuffer[TOTAL_SAMPLES];

//Match Filter Key Wave
int16_t key_wave[256] = {-1,0,1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0};

//Calibration value for Recalibration
uint32_t Scale = 2110431843;

//Declaring necessary variables
int count = 0;
int n,k;
int max_n = 10240;
int max_k = 256;

// Initialising the necessary peripherals
void app_init(void)
{
  //Initialising Energy Profile function tracing
  BSP_TraceProfilerSetup();

  // Initialising the LED
  initGPIO();

  //Initialising USART
  app_iostream_usart_init();

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
    }
}


void app_process_action(void)
{
  if(count == 5)
    {
      //Toggles LED0 to indicate the start of 10240 sample match filtering
      GPIO_PinOutToggle(GPIO_OUTPUT_0_PORT,GPIO_OUTPUT_0_PIN);
      //Reset count for next loop
      count=0;

      printf("st\n");
      //To print the samples collected
      //calc_action(singleBuffer);

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
          //Printing Match filter results
          printf("%d   ",loopsum);
      }
      printf("\nsp\n");

      //Toggles LED0 to indicate the end of 10240 sample match filtering
      GPIO_PinOutToggle(GPIO_OUTPUT_0_PORT,GPIO_OUTPUT_0_PIN);
      //Clearing LED1 for checking threshold in next loop
      GPIO_PinOutClear(GPIO_OUTPUT_1_PORT,GPIO_OUTPUT_1_PIN);
      //Initialisaing to collect the next set of samples
      initLDMA(singleBuffer, NUM_SAMPLES);
    }
}
