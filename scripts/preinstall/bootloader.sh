#!/bin/bash
clear
echo "Please choose your bootloader: "
select bootloader in "grub" "systemd-boot"
do
  case $bootloader in
    grub|systemd-boot)
      export BootLoader=${bootloader}
      break
    ;;
    *)
      echo "Not a valid choice"
  esac
done
