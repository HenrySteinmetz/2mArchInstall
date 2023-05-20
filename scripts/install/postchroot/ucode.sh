#!/bin/bash
# post chroot

cpu_type=$(lscpu | grep Vendor | awk '{print $3}')

case $cpu_type in
  AuthenticAMD)
    pacman -S --needed --noconfirm amd-ucode
  ;;
  GenuineIntel)
    pacman -S --needed --no-confirm intel-ucode
  ;;
  *)
    echo "Invalid CPU type"
    break
  ;;
esac
