#!/bin/bash
clear
echo "Choose your AUR helper"
select aur_helper in yay paru
do
  case $aur_helper in
    yay|paru)
      echo "AurHelper=${aur_helper}" >> ${SCRIPT_DIR}/vars.sh
      break
    ;;
    *)
      echo "Not a valid choice"
    ;;
  esac
done
