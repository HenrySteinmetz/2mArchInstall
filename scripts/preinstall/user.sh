#!/bin/bash
clear
echo "Please enter your user name"
read -p ": " user_name
export UserName=${user_name}

password() {
  echo "Enter your password"
  read -p ": " password
  echo "Re enter your password"
  read -p ": " password2
  
  if [[ "${password}" == "${password2}" ]]
  then
    export Password=${password} 
  else
    password
  fi
}
password

echo "Enter your hostname"
read -p ": " hostname
export Hostname=${hostname}
