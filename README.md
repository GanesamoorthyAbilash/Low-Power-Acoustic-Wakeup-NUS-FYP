# NUS_FYP
Low Power Acoustic Match Filter Detection with EFM32PG28B310F1024IM68

Calibration - For recalibrating IADC before use

Lowpower - System goes to sleep and wakesup every 60 seconds to collect 10240 ADC samples and perform match filtering

No Pingpong with print - System collect 10240 samples, performs match filtering, prints the results (combined use with Serial Port.ipynb) and loops back

Pingpong - System collect samples in a Pingpong method and performs match filtering. Results indicated by LED

Pingpong with print - System collect samples in a Pingpong method and performs match filtering and print the results (combined use with Serial Port.ipynb)

64 bit testing - The Waveform file used for generating the necessary test waves.

Serial Port - Collecting of data through Serial port and printing a graph result.
