#!/bin/env bash

if [ $(ls /bin/apt-get) = /bin/apt-get ];then
sudo apt install libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y 
elif [ $(ls /bin/pacman) = /bin/pacman ];then
sudo pacman -S libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y
elif [ $(ls /bin/dnf) = /bin/dnf ];then
sudo dnf install libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y
elif [ $(ls /bin/yum) = /bin/yum ];then
sudo yum install libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y
elif [ $(ls /bin/zypper) = /bin/zypper ];then
sudo zypper install libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y
elif [ $(ls /bin/eopkg) = /bin/eopkg ];then
sudo eopkg install libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y
elif [ $(ls /bin/xbps-install) = /bin/xbps-install ];then
sudo xbps-install libx11-dev libxft-dev libxinerama-dev make cmake feh acpi cruft-common upower -y
else
echo "An Unknown Error"
fi

if [ $(ls ~/.xsession) = $(ls $HOME/.xsession) ];then
cat ~/.xsession .xsession > temp
cat temp > ~/.xsession
rm -rf temp
else
echo "exec dwm" > ~/.xsession
fi

if [ $(ls ~/.bash_profile) = $(ls $HOME/.bash_profile) ];then
cat ~/.bash_profile .bash_profile > temp
cat temp > ~/.bash_profile
rm -rf temp
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
