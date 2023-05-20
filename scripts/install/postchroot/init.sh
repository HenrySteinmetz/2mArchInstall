#!/bin/bash
# post chroot

./config.sh
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
