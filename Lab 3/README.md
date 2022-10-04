# Chatterboxes
**Worked with: **


**LINEKER ONO-LOZANO**

[![Watch the video](https://user-images.githubusercontent.com/1128669/135009222-111fe522-e6ba-46ad-b6dc-d1633d21129c.png)](https://www.youtube.com/embed/Q8FWzLMobx0?start=19)

In this lab, we want you to design interaction with a speech-enabled device--something that listens and talks to you. This device can do anything *but* control lights (since we already did that in Lab 1).  First, we want you first to storyboard what you imagine the conversational interaction to be like. Then, you will use wizarding techniques to elicit examples of what people might say, ask, or respond.  We then want you to use the examples collected from at least two other people to inform the redesign of the device.

We will focus on **audio** as the main modality for interaction to start; these general techniques can be extended to **video**, **haptics** or other interactive mechanisms in the second part of the Lab.

## Prep for Part 1: Get the Latest Content and Pick up Additional Parts 

### Pick up Web Camera If You Don't Have One

Students who have not already received a web camera will receive their [IMISES web cameras](https://www.amazon.com/Microphone-Speaker-Balance-Conference-Streaming/dp/B0B7B7SYSY/ref=sr_1_3?keywords=webcam%2Bwith%2Bmicrophone%2Band%2Bspeaker&qid=1663090960&s=electronics&sprefix=webcam%2Bwith%2Bmicrophone%2Band%2Bsp%2Celectronics%2C123&sr=1-3&th=1) on Thursday at the beginning of lab. If you cannot make it to class on Thursday, please contact the TAs to ensure you get your web camera. 

### Get the Latest Content

As always, pull updates from the class Interactive-Lab-Hub to both your Pi and your own GitHub repo. There are 2 ways you can do so:

**\[recommended\]**Option 1: On the Pi, `cd` to your `Interactive-Lab-Hub`, pull the updates from upstream (class lab-hub) and push the updates back to your own GitHub repo. You will need the *personal access token* for this.

```
pi@ixe00:~$ cd Interactive-Lab-Hub
pi@ixe00:~/Interactive-Lab-Hub $ git pull upstream Fall2022
pi@ixe00:~/Interactive-Lab-Hub $ git add .
pi@ixe00:~/Interactive-Lab-Hub $ git commit -m "get lab3 updates"
pi@ixe00:~/Interactive-Lab-Hub $ git push
```

Option 2: On your your own GitHub repo, [create pull request](https://github.com/FAR-Lab/Developing-and-Designing-Interactive-Devices/blob/2022Fall/readings/Submitting%20Labs.md) to get updates from the class Interactive-Lab-Hub. After you have latest updates online, go on your Pi, `cd` to your `Interactive-Lab-Hub` and use `git pull` to get updates from your own GitHub repo.

## Part 1.

### Text to Speech 

In this part of lab, we are going to start peeking into the world of audio on your Pi! 

We will be using the microphone and speaker on your webcamera. In the home directory of your Pi, there is a folder called `text2speech` containing several shell scripts. `cd` to the folder and list out all the files by `ls`:

```
pi@ixe00:~/text2speech $ ls
Download        festival_demo.sh  GoogleTTS_demo.sh  pico2text_demo.sh
espeak_demo.sh  flite_demo.sh     lookdave.wav
```

You can run these shell files by typing `./filename`, for example, typing `./espeak_demo.sh` and see what happens. Take some time to look at each script and see how it works. You can see a script by typing `cat filename`. For instance:

```
pi@ixe00:~/text2speech $ cat festival_demo.sh 
#from: https://elinux.org/RPi_Text_to_Speech_(Speech_Synthesis)#Festival_Text_to_Speech

echo "Just what do you think you're doing, Dave?" | festival --tts
```

Now, you might wonder what exactly is a `.sh` file? Typically, a `.sh` file is a shell script which you can execute in a terminal. The example files we offer here are for you to figure out the ways to play with audio on your Pi!

You can also play audio files directly with `aplay filename`. Try typing `aplay lookdave.wav`.

\*\***Write your own shell file to use your favorite of these TTS engines to have your Pi greet you by name.**\*\*
(This shell file should be saved to your own repo for this lab.)

Please see helloPhil.sh file above

Bonus: If this topic is very exciting to you, you can try out this new TTS system we recently learned about: https://github.com/rhasspy/larynx

### Speech to Text

Now examine the `speech2text` folder. We are using a speech recognition engine, [Vosk](https://alphacephei.com/vosk/), which is made by researchers at Carnegie Mellon University. Vosk is amazing because it is an offline speech recognition engine; that is, all the processing for the speech recognition is happening onboard the Raspberry Pi. 

In particular, look at `test_words.py` and make sure you understand how the vocab is defined. 
Now, we need to find out where your webcam's audio device is connected to the Pi. Use `arecord -l` to get the card and device number:
```
pi@ixe00:~/speech2text $ arecord -l
**** List of CAPTURE Hardware Devices ****
card 1: Device [Usb Audio Device], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```
The example above shows a scenario where the audio device is at card 1, device 0. Now, use `nano vosk_demo_mic.sh` and change the `hw` parameter. In the case as shown above, change it to `hw:1,0`, which stands for card 1, device 0.  

Now, look at which camera you have. Do you have the cylinder camera (likely the case if you received it when we first handed out kits), change the `-r 16000` parameter to `-r 44100`. If you have the IMISES camera, check if your rate parameter says `-r 16000`. Save the file using Write Out and press enter.

Then try `./vosk_demo_mic.sh`

\*\***Write your own shell file that verbally asks for a numerical based input (such as a phone number, zipcode, number of pets, etc) and records the answer the respondent provides.**\*\*

### Serving Pages

In Lab 1, we served a webpage with flask. In this lab, you may find it useful to serve a webpage for the controller on a remote device. Here is a simple example of a webserver.

```
pi@ixe00:~/Interactive-Lab-Hub/Lab 3 $ python server.py
 * Serving Flask app "server" (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: on
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 162-573-883
```
From a remote browser on the same network, check to make sure your webserver is working by going to `http://<YourPiIPAddress>:5000`. You should be able to see "Hello World" on the webpage.

### Storyboard

Storyboard and/or use a Verplank diagram to design a speech-enabled device. (Stuck? Make a device that talks for dogs. If that is too stupid, find an application that is better than that.) 

\*\***Post your storyboard and diagram here.**\*\*



![storyboard0](https://user-images.githubusercontent.com/111994216/192409924-cb6696d5-ea79-4ad2-bbd6-daaf2bfe3600.png)

![storyboard1](https://user-images.githubusercontent.com/111994216/192409930-3d9b0572-503d-451a-888d-26ad2fa1da5e.png)

![Page1](https://user-images.githubusercontent.com/111994216/192413174-b6d63741-e435-4b81-be7f-f943090d746a.jpg)

![Page2](https://user-images.githubusercontent.com/111994216/192413187-b4ffdc22-b5d7-437d-b5ab-e9b3a6251806.jpg)

![Verplank Lab 3](https://user-images.githubusercontent.com/111994216/192413191-0a5953dc-2232-4642-80de-004e5b8078a0.jpg)


Write out what you imagine the dialogue to be. Use cards, post-its, or whatever method helps you develop alternatives or group responses. 

\*\***Please describe and document your process.**\*\*


User: Good Morning Mr. CooL Smart Fridge (MCSF), please provide morning updates



MCSF: Good morning [user name], Today is Monday 9:30 AM, Sept. 26th 2022. There will be 10% of rain at 1:15 PM with a high of 82 degrees F* and low of 68 F*. Would you like to know anything else?



User: Yes, please provide me with grocery list updates.



MCSF: Ok [user name], no problem. The following items are close to expiring: milk expires tomorrow, OJ expires on 9/30, yogurt expires on 9/30. The following items are running low: 2/12 eggs left, 1 apple left out of 4 last order. Would you like me to re-order these items?



User: Yes, please order milk, yogurt and eggs. 



MCSF: Ok, ordering 1 milk carton, 1 greek yogurt, and 1 carton of eggs from Wholefood Delivery. Your total is $9.72, would you like me to place the order?



User: Yes place order.



MSCF: Confirmed, order total is $9.72 and paid with Apple Pay. Receipt sent to e-mail. Order will be delivered tomorrow 9/27 at 12:00 pm. Is there anything else I can help you with?



User: No thats all thank you!




### Acting out the dialogue

Find a partner, and *without sharing the script with your partner* try out the dialogue you've designed, where you (as the device designer) act as the device you are designing.  Please record this interaction (for example, using Zoom's record feature).


https://user-images.githubusercontent.com/111994216/192414446-8ac89568-1608-4571-a6de-1a2c704bf77c.mp4

Read script with (friend) Luca


\*\***Describe if the dialogue seemed different than what you imagined when it was acted out, and how.**\*\*

The script went pretty much as we thought it would. The one thing we noticed from the script dry run was the user with very limited knowledge of the product did not know the full features the smart fridge had to offer. The user was also a little confused how to being the interaction with the device.



### Wizarding with the Pi (optional)
In the [demo directory](./demo), you will find an example Wizard of Oz project. In that project, you can see how audio and sensor data is streamed from the Pi to a wizard controller that runs in the browser.  You may use this demo code as a template. By running the `app.py` script, you can see how audio and sensor data (Adafruit MPU-6050 6-DoF Accel and Gyro Sensor) is streamed from the Pi to a wizard controller that runs in the browser `http://<YouPiIPAddress>:5000`. You can control what the system says from the controller as well!

\*\***Describe if the dialogue seemed different than what you imagined, or when acted out, when it was wizarded, and how.**\*\*

# Lab 3 Part 2

For Part 2, you will redesign the interaction with the speech-enabled device using the data collected, as well as feedback from part 1.

## Prep for Part 2

1. What are concrete things that could use improvement in the design of your device? For example: wording, timing, anticipation of misunderstandings...

\*\*We imagine the conversation happening on a phone or device with a screen, confirmation of what is being asked on the screen would be ideal, it would ensure that the requested groceries be easily confirmed.

Timing would also have to be improved, as the device is a bit slow in recognizing the words.

Lastly, understanding when the device is done speaking would be beneficial. Additionally, letting the user know that the device wants more input needs to be written in.\*\*

2. What are other modes of interaction _beyond speech_ that you might also use to clarify how to interact?

\*\*Since we imagine the device to have a screen we would use visual confirmation as the main form of clarification. However, voice recognition is for convenience, so we would create a device that repeats the request to the user, be it what is in the fridge or what is being ordered.\*\*

3. Make a new storyboard, diagram and/or script based on these reflections.

\*\* User and Mr. CooL Smart Fridge (MCSF) on 1st Use

User: Hello Mr. CooL Smart Fridge

MCSF: Hello, you can call me fridge or you can change my nickname in settings. I have a range of uses, you can check the contents of the  fridge or you can order more groceries by connecting one of your accounts. I don't want to bore you so how can I help you?

User: Fridge, do I need to do anything else to setup the fridge?

MCSF: No, I am ready to start registering your groceries and your shopping account is already connected.

User: Ok thanks.


User and Mr. CooL Smart Fridge (MCSF) on Regular Use

User: Hi fridge, can you tell me what groceries I have?

MCSF: Half a gallon of whole milk, a tub of fat free greek yogurt, a pint of rasberries, and a bag of spring mix, anything else I can help you with?

User: Is anything expiring soon?

MCSF: The spring mix expires in four days, everything else has over 1 week left. Anything else I can help you with?

User: Sure, can you order more spring mix and a some apples?

MCSF: I have one bag of spring mix and 1 pound of apples for $10.54 tomorrow for your preferred morning time, would you like me to place the order?

User: Am I getting free shipping?

MCSF: With your grocery prime account you are, would you like me to place the order for $10.54 at tomorrows preferred morning time?

User: Yes, thank you!

MCSF: Order placed, the receipt has been emailed. Your order will arrive tomorrow from 7 to 9 AM. Anything else I can do?

User: No thanks!


User and Mr. CooL Smart Fridge (MCSF) on Ordering from the phone at the grocery store

User: Hi fridge, I'm shopping, can you tell me if I have milk, eggs, and bacon?

MCSF: You have a quart of 2% milk, 1/2 gallon of oat milk, 4 of 12 eggs and half a packet of bacon. Is there anything else you'd like me to check?

User: How full is the oat milk?

MCSF: By my estimates it is at half the bottle, so 1/4 a gallon or 4 cups. Is there anything else?

User: No thanks!\*\*

## Prototype your system

The system should:
* use the Raspberry Pi
* use one or more sensors
* require participants to speak to it.

*Document how the system works*

*Include videos or screencaptures of both the system and the controller.*

## Test the system
Try to get at least two people to interact with your system. (Ideally, you would inform them that there is a wizard _after_ the interaction, but we recognize that can be hard.)

Answer the following:

### What worked well about the system and what didn't?
\*\* What Worked Well:
- The concept is simple enough that people understand it
- Used Alexa style of communication

What Didn't Work
- Concept still too open ended
- The full device didn't work smoothly
- Proximity sensor required very close proximity to start working\*\*

### What worked well about the controller and what didn't?

\*\*What Worked Well:
- N/A

What Didn't Work
- Glitchy and buggy when working
- As we added the proximity sensor we hit a bug and could not find it in time\*\*

### What lessons can you take away from the WoZ interactions for designing a more autonomous version of the system?

\*\*
- Using protocols that are used by other devices (Alexa, Siri, etc) works well as a lot of people are use to those types of devices.
- \*\*


### How could you use your system to create a dataset of interaction? What other sensing modalities would make sense to capture?

\*\*
- \*\*
