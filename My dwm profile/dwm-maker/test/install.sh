#!/bin/env bash

sudo apt install libx11-dev libxft-dev libxinerama-dev make cmake -y

sudo pacman -S libx11-dev libxft-dev libxinerama-dev make cmake -y

sudo dnf install libx11-dev libxft-dev libxinerama-dev make cmake -y

sudo yun install libx11-dev libxft-dev libxinerama-dev make cmake -y

sudo zypper install libx11-dev libxft-dev libxinerama-dev make cmake -y

sudo eopkg install libx11-dev libxft-dev libxinerama-dev make cmake -y

sudo xbps-install libx11-dev libxft-dev libxinerama-dev make cmake -y

cat ~/.xsession .xsession > temp
cat temp > ~/.xsession
rm -rf temp

cd dmenu
sudo make clean install

cd st
sudo make clean install

cd dwm
sudo make clean install
