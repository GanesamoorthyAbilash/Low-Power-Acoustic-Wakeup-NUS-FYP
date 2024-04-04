#Reference Programs
#https://pythonhosted.org/pyserial/shortintro.html#opening-serial-ports
#https://matplotlib.org/stable/gallery/index.html

import serial
import time
import sys
import matplotlib.pyplot as plt

# Defining the Serial Port Specs
com_port = 'COM8'  
baudrate = 115200 

# Starting the serial communication
ser = serial.Serial(com_port, baudrate, timeout=0)

collected_values_string = ""
collect_status=0

# This loop is to ensure there is no error in establishing and maintaining the serial port connection
try:
    # Looping continuously read data from the serial port
    while True:
        # Receiving data from the serial port
        data = ser.readline()

        # Uncomment the below 2 lines if data received needs to be printed
        #if data:
        #     print(data)
        if collect_status == 2:
            print(data)



        # Once the start bit has been detecting change status to start collecting data
        if data == b'st\r\n':
            print("Start bit detected, starting to collect data")
            collect_status = 1
        
        # If stop bit is received, stop collecting data and plot the graph
        elif data == b'sp\r\n':
            print("Stop command received. Stop collecting data.")
            collect_status = 2
            
            
            # Split collected values string into a list of numbers
            num_list = collected_values_string.split()
            print(num_list)
            # Convert the list of strings into a list of floats
            x_val = [int(num) for num in num_list]

            #Graph code
            plt.plot(x_val)
            plt.xlabel('Sample Number')
            plt.ylabel('Match Filter Values')
            plt.title('Plot of Match Filter Results')
            plt.grid(True)
            plt.show()
            collected_values_string = ""
            

        # If collecting status is 1, collect data
        elif collect_status == 1:
            collected_values_string += data.decode()    

            
        # Delay to wait for all processes to finish before next loop
        time.sleep(0.01)
        
except Exception as errormsg:
    print("Error:", errormsg)

finally:
    # Closing the serial port
    ser.close()
