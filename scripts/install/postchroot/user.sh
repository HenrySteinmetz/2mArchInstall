#!/bin/bash
# post chroot
clear
mkdir /home/${UserName}
if [[ ${Filesystem} == "btrfs" ]]
then
  useradd --btrfs-subvolume-home -m -G wheel -s /bin/zsh ${UserName}
else
  useradd -m -G wheel -s /bin/zsh ${UserName}
fi

echo "${UserName}":"${Password}" | chpasswd

sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
sed -i 's/^# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers

echo "${Hostname}" > /etc/hostname
