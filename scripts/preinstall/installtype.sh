#!/bin/bash
clear
echo "Choose your desired install type"
select install_type in full minimal xorg
do
  case $install_type in 
    full)
      echo "InstallType=${install_type}" >> ${SCRIPT_DIR}/vars.conf
      ./scripts/preinstall/aurhelper.sh
      ./scripts/preinstall/de.sh
      ./scripts/preinstall/browser.sh
      break
    ;;
    minmal|xorg)
      echo "InstallType=${install_type}" >> ${SCRIPT_DIR}/vars.conf
    ;;
    *)
      echo "Not a valid option"
    ;;
  esac
done
