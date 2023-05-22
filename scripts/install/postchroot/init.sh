#!/bin/bash
# post chroot


source vars.conf

./locale.sh
./user.sh
./pacman.sh
./ucode.sh
./graphicsdriver.sh

clear
echo -ne "
###################################################
/       Instalation finished you can now reboot   \\
###################################################
"
