#!/bin/env bash

echo "Downloading software please wait..."
sudo apt install xorg xorg-server xorg-xinit libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y
sudo pacman -S xorg xorg-server xorg-xinit xorg-xsetroot libx11 libxft libxinerama make cmake feh acpi upower gcc picom ttf-dejavu 
sudo dnf install xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-xinit-session libX11-devel libXft-devel libXinerama-devel make cmake upower gcc dejavu-sans-fonts xsetroot g++ picom feh acpi -y
sudo yum install xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-xinit-session libX11-devel libXft-devel libXinerama-devel make cmake upower gcc dejavu-sans-fonts -y
sudo zypper install xorg xorg-server xorg-xinit libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower
sudo eopkg install xorg xorg-server xorg-xinit libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower
sudo xbps-install xorg xorg-server xorg-xinit libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower

if [ $(ls ~/.xinitrc) = $(ls $HOME/.xinitrc) ];then
cat ~/.xinitrc .xinitrc > temp && cat temp > ~/.xinitrc && rm -rf temp
else
echo "exec dwm" > ~/.xinitrc
fi

if [ $(ls ~/.bash_profile) = $(ls $HOME/.bash_profile) ];then
cat ~/.bash_profile .bash_profile > temp && cat temp > ~/.bash_profile && rm -rf temp
else
echo "startx" > ~/.bash_profile
fi

mkdir ~/Wallpapers
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
