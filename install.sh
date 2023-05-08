#!/bin/bash

# install dependencies
sudo apt install -y \
    xorg \
    build-essential \
    libx11-dev \
    libxinerama-dev \
    sharutils \
    suckless-tools \
    libxft-dev \
    stterm \
    libxft-dev \
    git \
    vim \
    libwebkit2gtk-4.0-dev \
    x11-xserver-utils 

# remove everything gnome

sudo apt purge -y \
    gnome-shell \
    gnome-shell-common \
    gnome-shell-extension-* \
    gnome-shell-extension-desktop-icons \
    gnome-shell-extension-ubuntu-dock \
    gnome-shell-extensions \
    gnome-shell-extension-ubuntu-dock \
    gnome-shell-extension-appindicator 

# remove gdm3
sudo apt purge -y gdm3

# install lightdm
sudo apt install -y lightdm

# set lightdm as default display manager
sudo dpkg-reconfigure lightdm

# install dwm
git clone https://git.suckless.org/dwm
cd dwm
sudo make clean install
cd ..

# dwm .desktop file
sudo echo "[Desktop Entry]
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Type=XSession" > /usr/share/xsessions/dwm.desktop
