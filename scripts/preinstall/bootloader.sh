#!/bin/bash
clear
echo "Please choose your bootloader: "
select bootloader in "grub" "systemd-boot"
do
  case $bootloader in
    grub|systemd-boot)
      echo "BootLoader=${bootloader}" >> ${SCRIPT_DIR}/vars.conf
      break
    ;;
    *)
      echo "Not a valid choice"
  esac
done
