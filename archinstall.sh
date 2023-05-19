#!/bin/bash
# This script asks for general install type and initializes startup
# Discord: Handy#1684

export INSTALL_SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/scripts/install
export PREINSTALL_SCRIPTS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/scripts/preinstall
./scripts/preinstall/disks.sh
