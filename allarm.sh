#!/bin/bash

# Loop indefinitely
while true; do
  # Get the temperature values from the sensors command, one per line
  sensors | grep 'temp1:' | awk '{print $2}' | tr -d '+°C' | while read -r temp; do
    # Check if any temperature exceeds 50 degrees
    if [ "$(echo "$temp > 86" | bc -l)" -eq 1 ]; then
      # Play an alarm sound; ensure the path to your actual audio file is correct
         cvlc --play-and-exit /home/vincenzo/Scrivania/allarm.mp3

    fi
  done

  # Wait for a second before checking again
  sleep 1
done
