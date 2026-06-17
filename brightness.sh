#!/bin/bash
#
# Veeeery basic brightness control script that
# utilizes brightnessctl and zenity to create
# a screen-brightness slider.
#
# Written by Ex-IT guy for a Toshiba tablet
# https://exitguy.nl
#

# Get the current brightness value to set the slider
curry=$(brightnessctl g)

# Show the slider...
iwantthis=$(zenity --scale --title "Screen brightness control" \
  --text "Set brightness to the desired level" \
  --value $curry --min-value=1)

# Set brigtness to the chosen level
brightnessctl set $iwantthis 
