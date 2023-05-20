#!/bin/bash
# post chroot
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
timedatectl --no-ask-password set-timezone ${Timezone}
timedatectl --no-ask-password set-ntp 1

localectl --no-ask-password set-locale LANG="en_US.UTF-8" LC_TIME="en_US.UTF-8"
ln -s /usr/share/zoneinfo/${Timezone} /etc/localtime

localectl --no-ask-password set-keymap ${KeyboardLayout}
