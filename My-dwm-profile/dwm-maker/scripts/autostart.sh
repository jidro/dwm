#!/bin/env bash
./~/.dwm/dwm-autostart/scripts.sh

compton &

while true; do
	# ~/Wallpapers是存放壁纸的文件夹
	feh --recursive --randomize --bg-fill --no-fehbg ~/Wallpapers
	# 每600秒自动切换壁纸
	sleep 600
done