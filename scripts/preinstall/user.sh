#!/bin/bash
clear
echo "Please enter your user name"
read -p ": " user_name
echo "UserName=${user_name}" >> ${SCRIPT_DIR}/vars.conf

password() {
  echo "Enter your password"
  read -p ": " password
  echo "Re enter your password"
  read -p ": " password2
  
  if [[ "${password}" == "${password2}" ]]
  then
    echo "Password=${password}" >> ${SCRIPT_DIR}/vars.conf
  else
    password
  fi
}
password

echo "Enter your hostname"
read -p ": " hostname
echo "Hostname=${hostname}" >> ${SCRIPT_DIR}/vars.conf
