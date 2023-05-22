#!/bin/bash
clear
echo "Please choose your display manager"
select dm in lightdm gdm sddm none
do
  case $dm in 
    lightdm|gdm|sddm|none)
      echo "DisplayManager=${dm}" >> ${SCRIPT_DIR}/vars.conf
      break
    ;;
    *)
      echo "Invalid choice please rechoose"
    ;;
  esac
done
