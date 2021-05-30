#!/bin/env bash

sudo apt install libx11-dev libxft-dev libxinerama-dev make cmake feh acpi -y

sudo pacman -S libx11-dev libxft-dev libxinerama-dev make cmake feh acpi -y

sudo dnf install libx11-dev libxft-dev libxinerama-dev make cmake feh acpi -y

sudo yun install libx11-dev libxft-dev libxinerama-dev make cmake feh acpi -y

sudo zypper install libx11-dev libxft-dev libxinerama-dev make cmake feh acpi -y

sudo eopkg install libx11-dev libxft-dev libxinerama-dev make cmake feh acpi -y

sudo xbps-install libx11-dev libxft-dev libxinerama-dev make cmake feh acpi -y

cat ~/.xsession .xsession > temp
cat temp > ~/.xsession
rm -rf temp

mkdir ~/.dwm

cp scripts/autostart.sh ~/.dwm
cp scripts/dwm-autostart/ ~/.dwm

cp dmenu ~/.dwm
cd ~/dwm/dmenu
sudo make clean install

cp st ~/.dwm
cd ~/.dwm/st
sudo make clean install

cp dwm ~/.dwm
cd ~/.dwm/dwm
sudo make clean install
