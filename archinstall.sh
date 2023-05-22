#!/bin/bash
# This script asks for general install type and initializes startup
# Discord: Handy#1684
export PREINSTALL_SCRIPTS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/scripts/preinstall
export INSTALL_SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/scripts/install
export SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/scripts

#chmod 777 scripts/vars.conf
chmod +x scripts/preinstall/dependencies.sh
chmod +x scripts/preinstall/disks.sh
chmod +x scripts/preinstall/locale.sh
chmod +x scripts/preinstall/bootloader.sh
chmod +x scripts/preinstall/installtype.sh
chmod +x scripts/preinstall/aurhelper.sh
chmod +x scripts/preinstall/browser.sh
chmod +x scripts/preinstall/de.sh
chmod +x scripts/install/prechroot/chroot.sh
chmod +x scripts/install/prechroot/disks.sh
chmod +x scripts/install/postchroot/config.sh
chmod +x scripts/install/postchroot/graphicsdriver.sh
chmod +x scripts/install/postchroot/init.sh
chmod +x scripts/install/postchroot/locale.sh
chmod +x scripts/install/postchroot/pacman.sh
chmod +x scripts/install/postchroot/ucode.sh
chmod +x scripts/install/postchroot/user.sh
chmod +x scripts/install/vars.sh

./scripts/preinstall/dependencies.sh
./scripts/preinstall/disks.sh
./scripts/preinstall/locale.sh
./scripts/preinstall/user.sh
./scripts/preinstall/bootloader.sh
./scripts/preinstall/installtype.sh
./scripts/install/prechroot/disks.sh
#./scripts/install/prechroot/chroot.sh
