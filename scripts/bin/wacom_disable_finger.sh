#!/bin/bash

xinput disable "Wacom Bamboo Craft Finger touch"

xsetwacom --set "Wacom Bamboo Craft Pen stylus" Mode "Relative"
xsetwacom --set "Wacom Bamboo Craft Pen eraser" Mode "Relative"

#xsetwacom --list devices
#xsetwacom --set $STYLUS_ID Mode "Relative"
