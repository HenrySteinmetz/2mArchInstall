#!/bin/bash
# Discord: Handy#1684
# Github: https://github.com/HenrySteinmetz

if [[ "$InstallType" == "manual" ]]
then
  
  mkfs.${Filesystem} /dev/${RootPartition}
  mkfs.vfat -F 32 /dev/${RootPartition}
  if [[ "$Home" == "yes" ]]
  then
    mkfs.${Filesystem} /dev/${HomePartition}
  fi

elif [[ "$InstallType" == "automatic" ]]
then
  # credit ChrisTitusTech https://github.com/ChrisTitusTech/ArchTitus
  umount -A --recursive /mnt
  sgdisk -Z ${Disk}
  sgdisk -a 2048 -o ${Disk}
  sgdisk -n 1::+1M --typecode=1:ef02 --change-name=1:'BIOSBOOT' /dev/${Disk} # partition 1 (BIOS Boot Partition)
  sgdisk -n 2::+300M --typecode=2:ef00 --change-name=2:'EFIBOOT' /dev/${Disk} # partition 2 (UEFI Boot Partition)
  sgdisk -n 3::-0 --typecode=3:8300 --change-name=3:'ROOT' /dev/${Disk} # partition 3 (Root), default start, remaining
  if [[ ! -d "/sys/firmware/efi" ]]; then # Checking for bios system
    sgdisk -A 1:set:2 ${Disk}
  fi
  partprobe ${DISK} # reread partition table to ensure it is correct
  lsblk
  #mkfs.${Filesystem} /dev/${Drive}2

else
  echo "Error: Invalid install type"
  break
fi
