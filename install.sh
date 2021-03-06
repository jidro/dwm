#!/bin/env bash

echo "Downloading software please wait..."
sudo apt install xorg xinit x11-xserver-utils libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower picom gcc g++ rofi fonts-dejavu -y
sudo pacman -S xorg xorg-server xorg-xinit xorg-xsetroot libx11 libxft libxinerama make cmake feh acpi upower gcc picom rofi ttf-dejavu 
sudo dnf install xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-xinit-session libX11-devel libXft-devel libXinerama-devel make cmake upower gcc dejavu-sans-fonts xsetroot g++ picom feh acpi -y
sudo yum install xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-xinit-session libX11-devel libXft-devel libXinerama-devel make cmake upower gcc dejavu-sans-fonts -y
sudo zypper install xorg-x11 xorg-x11-devel xorg-x11-server xinit libX11-devel libXft-devel libXinerama-devel make cmake git feh acpi upower gcc dejavu-fonts wqy-microhei-fonts xsetroot gcc-c++ picom rofi
#sudo pkg install git xorg xorg-server xinit libX11 libXft libXinerama cmake gccmakedep gmake feh acpi_call acpica-tools upower xsetroot picom rofi autoconf dejavu wqy-fonts #Currently, FreeBSD has not been successfully installed and is temporarily sealed.
sudo eopkg install xorg-server xorg-server-devel xinit libx11-devel libxft-devel libxinerama-devel make cmake feh acpi upower gcc g++ dejavu-fonts-ttf xsetroot picom pkg-config automake autoconf libtool
sudo eopkg install -c system.devel
sudo xbps-install xorg xorg-server xorg-server-devel xinit libX11-devel libXft-devel libXinerama libXinerama-devel make cmake feh acpi upower gcc xsetroot picom pkg-config rofi automake autoconf libtool dejavu-fonts-ttf wqy-microhei git -y

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

sudo touch *

cp -r dmenu ~/.dwm
cd ~/dwm/dmenu
sudo make clean install

cp -r st ~/.dwm
cd ~/.dwm/st
sudo make clean install

cp -r dwm ~/.dwm
cd ~/.dwm/dwm
sudo make clean install
