#!/bin/bash
# Discord: Handy#1684
# Github: https://github.com/HenrySteinmetz
cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
mkdir -p /mnt/root/2mArchInstall
cp -r ${INSTALL_SCRIPT_DIR}/postchroot/ /mnt/root/2mArchInstall
cp ${SCRIPT_DIR}/vars.conf /mnt/root/2mArchInstall/postchroot
pacstrap -K /mnt base linux linux-firmware zsh
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt bash /root/2mArchInstall/postchroot/init.sh
