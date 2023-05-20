#!/bin/bash
# This script asks for general install type and initializes startup
# Discord: Handy#1684

export INSTALL_SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/scripts/install
export PREINSTALL_SCRIPTS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/scripts/preinstall

./scripts/preinstall/dependencies.sh
./scripts/preinstall/disks.sh
./scripts/preinstall/locale.sh
./scripts/preinstall/user.sh
./scripts/preinstall/bootloader.sh
./scripts/preinstall/installtype.sh
./scripts/install/prechroot/disks.sh
./scripts/install/prechroot/chroot.sh
