#!/bin/bash
# post chroot

if [[ "${InstallType}" == "full" ]] || [[ "${InstallType}" == "xorg" ]]
then
  gpu_type=$(lspci)
  if grep -E "NVIDIA|GeForce" <<< ${gpu_type}
  then
    case $DesktopEnviorment in
      hyprland)
        pacman -S --noconfirm --needed nvidia-dkms
      ;;
      *)
        pacman -S --noconfirm --needed nvidia
      ;;
    esac
	nvidia-xconfig

  elif lspci | grep 'VGA' | grep -E "Radeon|AMD"
  then
    pacman -S --noconfirm --needed xf86-video-amdgpu
  
  elif grep -E "Integrated Graphics Controller" <<< ${gpu_type}
  then
    pacman -S --noconfirm --needed libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils lib32-mesa
  
  elif grep -E "Intel Corporation UHD" <<< ${gpu_type}
  then
    pacman -S --needed --noconfirm libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils lib32-mesa
  fi
fi
