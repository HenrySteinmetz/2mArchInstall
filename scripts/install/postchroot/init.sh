#!/bin/bash
# post chroot


source vars.conf

./locale.sh
./user.sh
./pacman.sh
./bootloader.sh
./ucode.sh
./graphicsdriver.sh
./de.sh
./dm.sh

if [[ "${InstallType}" == "Xorg" ]]
then
  ./xorg.sh

elif [[ "${InstallType}" == "full" ]]
then
  ./aurhelper.sh
  ./de.sh
  ./browser.sh 
fi

clear
echo -ne "
###################################################
/       Instalation finished you can now reboot   \\
###################################################
"
