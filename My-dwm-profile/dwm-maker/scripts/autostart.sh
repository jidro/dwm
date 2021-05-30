#!/bin/env bash
/bin/bash ~/.dwm/dwm-autostart/scripts.sh &

compton &

#/bin/bash ~/.dwm/dwm-autostart/wallpapers.sh &
while true; do
	# ~/Wallpapers是存放壁纸的文件夹
	feh --recursive --randomize --bg-fill --no-fehbg ~/Wallpapers
	# 每10分钟自动切换壁纸
	sleep 600
done
