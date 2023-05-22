#!/bin/bash

case ${DesktopEnviorment} in
  bspwm)
    pacman -S --needed --noconfirm bspwm sxhkd
    ;;
  i3)
    pacman -S --needed --noconfirm i3-wm
    ;;
  kde)
    pacman -S --needed --noconfirm plasma-meta
    ;;
  mate)
    pacman -S --needed --noconfirm mate mate-extra
    ;;
  xfce)
    pacman -S --needed --noconfirm xfce4
    ;;
  *)
    pacman -S --needed --noconfirm ${DesktopEnviorment}
    ;;
esac

