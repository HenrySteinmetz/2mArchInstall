#!/bin/bash
clear
echo "Choose your AUR helper"
select aur_helper in yay paru
do
  case $aur_helper in
    yay|paru)
      export AurHelper=${aur_helper}
      break
    ;;
    *)
      echo "Not a valid choice"
    ;;
  esac
done
