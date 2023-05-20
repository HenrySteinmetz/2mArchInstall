#!/bin/bash
clear
echo "Pick your desired desktop enviorment/window manager"
select de in kde xfce gnome cinnamon mate hyprland i3 awesomewm bspwm dwm xmonad
do
  case $de in 
    kde|xfce|gnome|cinnamon|mate|hyprland|i3|awesomewm|bspwm|dwm|xmonad)
      echo "DesktopEnviorment=${de}" >> ${SCRIPT_DIR}/vars.sh
      break
    ;;
    *)
      echo "Not a valid desktop enviorment"
    ;;
  esac
done
