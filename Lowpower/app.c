// Reference Programs:
//https://github.com/SiliconLabs/peripheral_examples/blob/master/series2/iadc/iadc_single_low_current/src/main_single_low_current.c
//Drivers from Simplicity Studio 5 gecko SDK 4.4.1
//PG28 Pro Kit Example Project ==> Platform - I/O Stream USART Bare-metal
//PG28 Pro Kit Example Project ==> Platform - Sleeptimer Bare-metal

#include "app_peripherals.h"
#include <stdio.h>
#include <math.h>
#include <string.h>
#include "em_gpio.h"
#include "em_cmu.h"
#include "em_ldma.h"
#include "em_iadc.h"
#include "sl_device_init_dcdc.h"
#include "em_emu.h"


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

//Buffer to store IADC results
uint16_t singleBuffer[TOTAL_SAMPLES];

//Match Filter Key Wave
int16_t key_wave[256] = {-1,0,1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,1,0,-1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0,1,0,-1,0,-1,0,1,0};

//Calibration value for Recalibration
uint32_t Scale = 2110431843;

//Declaring necessary variables
int n,k;
int max_n = 10240;
int max_k = 256;
int count = 0;


// Initialising the EM2 mode, sleeptimer and LED
void app_init(void)
{
  em23start();
  sleeptimer_app_init();
  initGPIO();
}



//Function called by LDMA IRQ callback
void addcount(void)
{
 count++;
 //Loop to collect 10240 samples by looping 5 times
  if (count<=4)
    {
    //Initialise the next loop collection
    initLDMA(&singleBuffer[NUM_SAMPLES*count], NUM_SAMPLES);

    //Hook to prevent going back to EM2 before collection and processing of data
    while (LDMA_IntGetEnabled()==0)
      {
      }
    }
  //Once all 10240 samples are collected
  else if (count==5)
    {
     //Reset count for next loop
     count=0;

     //Setting system to a high clock for faster processing
     CMU_HFRCODPLLBandSet(HFRCODPLL_FREQ);
     CMU_ClockSelectSet(cmuClock_SYSCLK, cmuSelect_HFRCODPLL);

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

      //Disabling the below to reduce power consumption
      IADC_reset(IADC0);
      CMU_ClockEnable(cmuClock_IADC0, false);
      CMU_ClockEnable(cmuClock_LDMA, false);
      //Reinitialise EM2 mode
      em23start();
    }
}

//Function called by Sleeptimer IRQ callback
void flagset(void)
{
  GPIO_PinOutClear(GPIO_OUTPUT_1_PORT,GPIO_OUTPUT_1_PIN);
  //Toggle to check sleeptimer trigger
  GPIO_PinOutToggle(GPIO_OUTPUT_0_PORT,GPIO_OUTPUT_0_PIN);

  //Reinitialising DCDC regulator as it is affected by EM2 sleep
  sl_device_init_dcdc();
  //Initialising the necessary functions for IADC and LDMA
  initIADC();
  IADCRescale(Scale);
  initLDMA(singleBuffer,NUM_SAMPLES);

  //Hook to prevent going back to EM2 before collection and processing of data
  while (LDMA_IntGetEnabled()==0)
    {
    }
}

void app_process_action(void)
{
   EMU_EnterEM2(false);
}

