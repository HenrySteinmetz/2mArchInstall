#!/bin/bash
clear
echo "Choose your desired install type"
select installtype in full minimal xorg
do
  case $installtype in 
    full|minimal|xorg)
      export InstallType=${InstallType}
      ./scripts/preinstall/aurhelper.sh
      ./scripts/preinstall/de.sh
      ./scripts/preinstall/browser.sh
      break
    ;;
    *)
      echo "Not a valid option"
    ;;
  esac
done
