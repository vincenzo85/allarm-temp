# allarm-temp
Allarm sh script
Script per un allarme di temperatura in sh per ubuntu 
install 
sudo apt-get install vlc-bin
rendi eseguibile il file sh 

To create an alarm that triggers a sound when the temperature exceeds 80°C using the output from the sensors command, you will need a script that continuously checks the temperature and plays a sound if the condition is met. Here's a basic example using a shell script:

Step 1: Choose a Sound File
First, you'll need a WAV or MP3 file to play as an alarm. Ensure this file is accessible on your system.

Step 2: Create the Script
You can create a bash script that uses sensors, grep, awk, and a command to play sound (like aplay for WAV files or mpg123 for MP3 files).

Here's a simple script to get you started:

bash
Copy code
#!/bin/bash

# Loop indefinitely
while true; do
  # Get the temperature value from the sensors command
  temp=$(sensors | grep 'temp1:' | awk '{print $2}' | sed 's/+//' | sed 's/\.0°C//')

  # Check if the temperature exceeds 80 degrees
  if (( $(echo "$temp > 80" | bc -l) )); then
    # Play an alarm sound; change '/path/to/alarm.mp3' to the path of your actual audio file
    mpg123 /path/to/alarm.mp3
  fi

  # Wait for a second before checking again
  sleep 1
done
Explanation of the Script Components:
The script runs an infinite loop using while true.
It extracts the temperature using sensors, filters with grep, and formats with awk and sed.
It checks if the temperature exceeds 80 using bc (a calculator).
If the condition is true, it plays the sound using mpg123. Replace mpg123 with aplay if you have a WAV file and adjust the file path to your sound file.
It waits one second before repeating the check using sleep 1.
Step 3: Running the Script
Save the script to a file, for example, alarm.sh.
Make the script executable with chmod +x alarm.sh.
Run the script in the background or a separate terminal with ./alarm.sh.
