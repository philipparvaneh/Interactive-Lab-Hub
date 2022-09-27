#from: https://elinux.org/RPi_Text_to_Speech_(Speech_Synthesis)#Festival_Text_to_Speech

echo "Please Provide Your Cell Phone Number." | festival --tts
python3 test_words.py recorded_mono.wav