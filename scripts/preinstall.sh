#!/bin/bash
# This script sets up mirrors and basic packages for the later installation
# Discord: Handy#1684

echo -ne "
######################################################
/  Setting up mirrors and installing basic packages  \\
######################################################
"

pacman -Sy base
pacman -S --noconfirm reflector rsync curl
reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
if [ "$INSTALLTYPE" = "MINIMAL" ]; then
  echo -ne "
##############################
/ Setting up minimal install \\
##############################
  "
elif [ "$INSTALLTYPE" = "DESKTOP"]; then
  echo -ne "
##############################
/ Setting up desktop install \\
##############################
  "
else 
  echo -ne "Error: installtype not set or illegal"
  exit
fi
