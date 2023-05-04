#!/bin/env bash

# feh is a lightweight image viewer aimed mainly 
# at users of command line interfaces.
# Unlike most graphical image viewers, 
# feh does not have any graphical control elements 
# (apart from an optional file name display) 
# which enables it to also be used to display background images 
# on systems running the X window system.

# This script will use feh to set the background image. 
# Please download and install the feh application software 
# before using this script to configure the background image.
while true; do
	# Parameter '--no-fehbg' indicates the folder 
	# where the background image resides. 
	# Please replace it with the folder name you need. 
	# By default, the backgrounds are searched and set 
	# from /usr/share/backgrounds folder.
	#feh --recursive --randomize --bg-scale --no-fehbg $HOME/.local/share/wallpapers/
	#feh --recursive --randomize --bg-scale --no-fehbg /usr/share/backgrounds/
	feh --recursive --randomize --bg-scale --no-fehbg /usr/share/backgrounds/
	#feh --recursive --randomize --bg-scale --no-fehbg /usr/share/wallpapers/
	# The parameters in the following line are 
	# set to automatically change the desktop wallpaper 
	# every 600 seconds.
	sleep 600
done
