#!/bin/bash
case ${BootLoader} in
  grub)
    pacman -S --needed --no-confirm grub efibootmgr os-prober
    if [ -d /sys/firmware/efi ]
    then
      grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB
    else
      grub-install --target=i386-pc /dev/${Disk}
    fi
    grub-mkconfig -o /boot/grub/grub.cfg
    ;;
  systemd-boot)
    if [ -d /sys/firmware/efi ]
    then
      bootctl install
    else
      echo "You can't install systemd-boot on BIOS systems"
      exit
    fi
    ;;
esac
