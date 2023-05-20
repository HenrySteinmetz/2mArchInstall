#!/bin/bash
# Discord: Handy#1684
# Github: https://github.com/HenrySteinmetz
echo "export AurHelper=${AurHelper}\nexport Bootloader=${BootLoader}\nexport Browser=${Browser}\nexport DesktopEnviorment=${DesktopEnviorment}\nexport InstallType=${InstallType}\n export KeyboardLayout=${KeyboardLayout}\nexport Timezone=${Timezone}\nexport Hostname=${Hostname}\nexport UserName=${UserName}\nexport Password=${Password}" >> ${INSTALL_SCRIPT_DIR}/postchroot/config.sh

cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
cp -r ${INSTALL_SCRIPT_DIR}/postchroot/ /mnt/root/2mArchInstall
pacstrap -K /mnt base linux linux-firmware zsh
arch-choot /mnt /root/2mArchInstall/init.sh
