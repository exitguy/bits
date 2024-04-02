#!/bin/bash
#
# Just a bogus script that pretends to bake a cake.
# Written by Ex-IT guy
#
# This script requires 'something.pl', from the same repository, and 'dialog' to be installed.

otemp=$(dialog --title "Preheat the oven" --rangebox "Preheat to what temperature (°C)" 8 51 150 250 200 --output-fd 1)
./something.pl -t 180 -b "" -s | dialog --gauge "Preheating to ${otemp%* }°C" 8 60 0

otime=$(dialog --title "Baking time!" --rangebox "How long (in minutes) does the cake need to be in the oven?" 4 51 5 320 180 --output-fd 1)
./something.pl -t $((otime * 60)) -b "" -s | dialog --gauge "Baking your cake! This might take a while..." 8 60 0

dialog --infobox 'Your cake is ready!' 4 60 & read
