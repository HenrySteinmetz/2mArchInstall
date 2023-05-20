#!/bin/bash
# Discord: Handy#1684
# Github: https://github.com/HenrySteinmetz

source ${SCRIPT_DIR}/vars.sh

createsubvolumes () {
    btrfs subvolume create /mnt/@
    btrfs subvolume create /mnt/@home
    btrfs subvolume create /mnt/@var
    btrfs subvolume create /mnt/@tmp
    btrfs subvolume create /mnt/@.snapshots
}

if [[ "$PartioningStyle" == "manual" ]]
then
  
  mkfs.${Filesystem} /dev/${RootPartition}
  mkfs.vfat -F 32 /dev/${RootPartition}
  
  if [[ "${Filesystem}" == "btrfs" ]]
  then

    createsubvolumes
    mount -o subvol=@home /dev/${RootPartition} /mnt/home
    mount -o subvol=@tmp /dev/${RootPartition} /mnt/tmp
    mount -o subvol=@var /dev/${RootPartition} /mnt/var
    mount -o subvol=@.snapshots /dev/${RootPartition} /mnt/.snapshots
  fi
  
  mount /dev/$[RootPartition] /mnt
  mount --mkdir /dev/${BootPartition} /mnt/boot

  if [[ "$Home" == "yes" ]]
  then
    mkfs.${Filesystem} /dev/${HomePartition}
    mount --mkdir /dev/${HomePartition}
  fi


else
  # credit ChrisTitusTech https://github.com/ChrisTitusTech/ArchTitus
  umount -A --recursive /mnt
  sgdisk -Z ${Disk}
  sgdisk -a 2048 -o ${Disk}
  sgdisk -n 1::+1M --typecode=1:ef02 --change-name=1:'BIOSBOOT' /dev/${Disk} # partition 1 (BIOS Boot Partition)
  sgdisk -n 2::+300M --typecode=2:ef00 --change-name=2:'EFIBOOT' /dev/${Disk} # partition 2 (UEFI Boot Partition)
  sgdisk -n 3::-0 --typecode=3:8300 --change-name=3:'ROOT' /dev/${Disk} # partition 3 (Root), default start, remaining
  if [[ ! -d "/sys/firmware/efi" ]]; then # Checking for bios system
    sgdisk -A 1:set:2 /dev/${Disk}
    export Boot="bios"
  else
    export Boot="efi"
  fi
  partprobe ${Disk} # reread partition table to ensure it is correct
  
  mkfs.${Filesystem} /dev/${Disk}2
  mkfs.vfat -F 32 /dev/${Disk}1
  
  if [[ "${Filesystem}" == "btrfs" ]]
  then
    createsubvolumes
    mount -o subvol=@home /dev/${Drive}2 /mnt/home
    mount -o subvol=@tmp /dev/${Drive}2 /mnt/tmp
    mount -o subvol=@var /dev/${Drive}2 /mnt/var
    mount -o subvol=@.snapshots /dev/${Drive}2 /mnt/.snapshots
  fi

  mount /dev/${Disk}2 /mnt
  mount --mkdir /dev/${Disk}1 /mnt/boot 
fi
genfstab -U /mnt >> /mnt/etc/fstab
