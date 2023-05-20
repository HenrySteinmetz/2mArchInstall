#!/bin/bash
# Discord: Handy#1684
# Github: https://github.com/HenrySteinmetz
echo "AurHelper=${AurHelper}" 
echo "BootLoader=${BootLoader}" 
echo "Browser=${Browser}"
echo "DesktopEnviorment=${DesktopEnviorment}"
echo "InstallType=${InstallType}"
echo "KeyboardLayout=${KeyboardLayout}"
echo "Timezone=${Timezone}"
echo "Hostname=${Hostname}"
echo "UserName=${UserName}"
echo "Password=${Password}"

#cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
#mkdir -p /mnt/root/2mArchInstall
#cp -r ${INSTALL_SCRIPT_DIR}/postchroot/ /mnt/root/2mArchInstall
#pacstrap -K /mnt base linux linux-firmware zsh
#arch-chroot /mnt /root/2mArchInstall/postchroot/init.sh
