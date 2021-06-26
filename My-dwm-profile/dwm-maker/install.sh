#!/bin/env bash

sudo apt install xorg libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y

sudo pacman -S xorg libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y

sudo dnf install xorg libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y

sudo yun install xorg libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y

sudo zypper install xorg libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y

sudo eopkg install xorg libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y

sudo xbps-install xorg libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y

cat ~/.xsession .xsession > temp
cat temp > ~/.xsession
rm -rf temp

cat ~/.bash_profile .bash_profile > temp
cat temp > ~/.bash_profile
rm -rf temp

mkdir ~/.dwm

cp scripts/autostart.sh ~/.dwm
cp -r scripts/dwm-autostart/ ~/.dwm

cp -r dmenu ~/.dwm
cd ~/dwm/dmenu
sudo make clean install

cp -r st ~/.dwm
cd ~/.dwm/st
sudo make clean install

cp -r dwm ~/.dwm
cd ~/.dwm/dwm
sudo make clean install
