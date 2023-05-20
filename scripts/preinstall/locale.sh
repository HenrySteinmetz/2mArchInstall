#!/bin/bash
clear
detected_timezone="$(curl --fail https://ipapi.co/timezone)"

function in_array {
  ARRAY=$2
  for e in ${ARRAY[*]}
  do
    if [[ "$e" == "$1" ]]
    then
      return 0
    fi
  done
  return 1
}
input_timezone() {
    echo "Enter your current timezone e.g. Europe/Berlin"
    read -p ": " input_timezone
    if grep /mnt/usr/share/zoneinfo/${input_timezone}
    then
      echo "Timezone=${input_timezone}" >> ${SCRIPT_DIR}/vas.sh
    else
      input_timezone
    fi
}

echo "Is ${detected_timezone} your timezone?"
read -p "(Y/N) : " corect_timezone
case $corect_timezone in
  Y|y)
    echo "Timezone=${detected_timezone}" >> ${SCRIPT_DIR}/vars.sh
  ;;
  N|n)
    input_timezone
  ;;
esac

echo "Select your keyboard layout"
keyboard_layout_options=('us' 'by' 'ca' 'cf' 'cz' 'de' 'dk' 'es' 'et' 'fa' 'fi' 'fr' 'gr' 'hu' 'il' 'it' 'lt' 'lv' 'mk' 'nl' 'no' 'pl' 'ro' 'ru' 'sg' 'ua' 'uk')

select keyboard_layout in "${keyboard_layout_options[@]}"
do
  echo "KeyboardLayout=$keyboard_layout" >> ${SCRIPT_DIR}/vars.sh
  break
done
