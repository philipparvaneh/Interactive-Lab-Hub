# Final Project
# TEAM: WHERE'S BIG RED?
# MEMBERS: Lineker Ono-Lozano, Tony Wan, Ravi Niteesh Voleti, Philip Parvaneh



## Deliverables

1. Project plan: Big idea, timeline, parts needed, fall-back plan.



   --Big Idea: Utilizing our Raspberry Pi devices, we will be creating a working UWB sensor that can mount in a room to pinpoint Big Red's location within that area.
   
   
   
   --Timeline: Order sensor, setup configuration with pi, test signal, run experiment, review results, integrate with a phone, reiterate
   
   
   
   --Parts Needed: 3 UWB sensors (already ordered), raspberry pi
   
   
   
   --Risks/ Contingencies: Power supply, failure to recognize device/users, possible compatibility error
   
   
   
   --Fall-Back Plan: Research other possible UWB sensors to use, use Wifi instead of UWB
   
   
   
   
---------------------------------------------------------------------------------------------------------------

## Documentation 
![WhatsApp Image 2022-12-16 at 3 43 24 AM](https://user-images.githubusercontent.com/111994216/208128447-66cd8f7f-a7de-4115-acc3-916cb22ba04a.jpeg)
![WhatsApp Image 2022-12-15 at 3 49 54 PM](https://user-images.githubusercontent.com/111994216/208128454-d5a87c96-63bb-48cf-89be-7a73d4af1890.jpeg)

UWB Setup:


Before we set up the device we needed to ensure the UWB sensor was set up correctly.
We began by connecting it directly to the Raspberry Pi and trying to find a signal. 
We found that the UWB sensor needed to be set up and a blinking red light meant that it was powered but not set up for anything. 
We tested several connections using Pi connections and a pin extender. We found the pins were loose and required the UWB sensor to be soldered onto the pin extender. 
After attempting to solder the sensor to the extender we found that there were soldering issues that would lose display usability.
We decided to explore other options. 
We connected the UWB sensor with a USB-to-MicroUSB cable and found the same usability as the Raspberry Pi pins, so we decided to go that route. 
After researching how to set up the UWB sensor, we found that we would need to flash the sensor. 
We used Segger-JFlashLite to flash the sensor - we had some issues with the newer M1 macs but were able to achieve this using the intel Macs.
We found the specs from the provided Qorvo spec sheet and used their provided Data Files to program/flash the device.
After a few trial runs we were finally able to flash all 3 sensors. 

UWB x Raspberry Pi Connection


Given the UWB sensor is branded we had to use the Qorvo licensing and API in order to collect the data onto the Raspberry Pi. 
Data is collected directly on the UWB sensor, we use the API to connect the Raspberry Pi to the sensor and send that data to MQTT in order to provide the relevant information to the application we modified to use for iPhone. 

iOS Application


Qorvo provides an application that reads UWB distance data.
We purchased an Apple developer account in order to test and simulate the changes required for the application. 
We added voice commands to be triggered by each meter marker.
We also added directional navigation by pulling on the compass from the iPhone. 
We can have the application direct the user toward the target using distance and directionality. 


![WhatsApp Image 2022-12-16 at 7 10 05 PM](https://user-images.githubusercontent.com/111994216/208213455-eb40a809-2053-475d-b644-fb694a0c2e83.jpeg)

![WhatsApp Image 2022-12-16 at 7 10 15 PM](https://user-images.githubusercontent.com/111994216/208213460-c809245f-8359-4b04-aa76-b17a373fa18e.jpeg)


![WhatsApp Image 2022-12-16 at 7 10 25 PM](https://user-images.githubusercontent.com/111994216/208213462-33a02ad6-dd1c-49f8-81a8-2ca7516d51c5.jpeg)




Video:


https://drive.google.com/file/d/1K3N6vAUMsIkReDxYst52HrPbW2mz3GPN/view?usp=sharing

Code :


https://github.com/philipparvaneh/Interactive-Lab-Hub/tree/Fall2022/final


