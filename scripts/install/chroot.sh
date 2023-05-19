#!/bin/bash
# Discord: Handy#1684
# Github: https://github.com/HenrySteinmetz

pacstrap -K /mnt base linux linux-firmware
cp -r ${INSTALL_SCRIPT_DIR} /mnt/root/2mArchInstall
arch-choot /mnt /root/2mArchInstall
sed -i 's/^#ParallelDownloads/ParallelDownloads/' /etc/pacman.conf
