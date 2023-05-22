#!/bin/bash

case ${Browser} in 
  brave)
    ${AurHelper} -S --needed --noconfirm brave-bin
    ;;
  chrome)
    ${AurHelper} -S --needed --noconfirm google-chrome
    ;;
  *)
    pacman -S --needed --noconfirm ${Browser}
    ;;
esac
