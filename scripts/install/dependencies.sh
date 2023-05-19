#!/bin/bash
# Discord: Handy#1684
# Github: https://github.com/HenrySteinmetz


echo -ne "
#############################################################
/  Setting up mirrors and installing dependencies packages  \\
#############################################################
"

pacman -Sy --noconfirm archlinux-keyring
reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacman -S --noconfirm reflector rsync curl 
