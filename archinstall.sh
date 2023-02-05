#!/bin/bash
# This script asks for general install type and initializes startup
# Discord: Handy#1684

set -a
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SCRIPTS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/scripts
CONFIGS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/configs
PACKAGES_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/packages
set +a

echo -ne "
Please choose an install type from bellow:
  
  [1] Minimal
  [2] Desktop

"

read -r -p ": " InstallType

case $InstallType in 
  "1" | "d" | "D")
    set -a 
    INSTALLTYPE=MINIMAL
    set +a
    ;;

  "2" | "m" | "M")
    set -a 
    INSTALLTYPE=DESKTOP 
    set +a
    ;;

esac

./scripts/preinstall.sh
