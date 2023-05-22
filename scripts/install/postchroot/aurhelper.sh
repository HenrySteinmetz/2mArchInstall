#!/bin/bash

if [[ "${AurHelper}" == "yay" ]]
then
  pacaman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
elif [[ "${AurHelper}" == "paru" ]]
then
  pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
else 
  echo "AurHelper variable not set"
  exit
fi
