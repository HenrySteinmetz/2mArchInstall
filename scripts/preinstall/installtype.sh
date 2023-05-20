#!/bin/bash
clear
echo "Choose your desired install type"
select installtype in full minimal xorg
do
  case $installtype in 
    full|minimal|xorg)
      export InstallType=${InstallType}
      ./aurhelper.sh
      ./de.sh
      ./browser.sh
      break
    ;;
    *)
      echo "Not a valid option"
    ;;
  esac
done
