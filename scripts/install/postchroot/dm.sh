#!/bin/bash

if [[ "{DisplayManager}" == "none" ]]
then
  case ${DektopEnviorment} in
    hyprland)
      mkdir -p /home/${UserName}/.local/bin
      touch /home/${UserName}/.local/bin/wrappedhl
      echo -ne "
      #!/usr/bin/env bash
      # wrappedhl
      # Launch Hyprland with a simple wrapper

      cd ~

      # Variables
      export _JAVA_AWT_WM_NONREPARENTING=1
      export XCURSOR_SIZE=24

      # Execute Hyprland
      if [ -f /usr/local/bin/Hyprland ]; then
      exec /usr/local/bin/Hyprland >/dev/null 2>&1 
      elif [ -f /usr/bin/Hyprland ]; then
      exec /usr/bin/Hyprland >/dev/null 2>&1 
      fi
      " >> /home/${UserName}/.local/bin/wrappedhl
      mkdir -p /etc/zsh
      touch /etc/zsh/zprofile
      echo -ne "
      emulate sh -c 'source /etc/profile'
      bash /home/${UserName}/.local/bin/wrappedhl
      " >> /etc/zsh/zprofile
      ;;
    gnome)
      touch /home/${UserName}/.xinitrc
      echo "export XDG_SESSION_TYPE=x11" >> /home/${UserName}/.xinitrc
      echo "export GDK_BACKEND=x11" >> /home/${UserName}/.xinitrc
      echo "exec gnome-session" >> /home/${UserName}/.xinitrc
      ;;
    kde)
      touch /home/${UserName}/.xinitrc
      echo "export DESKTOP_SESSION=plasma" >> /home/${UserName}/.xinitrc
      echo "exec startplasma-x11" >> /home/${UserName}/.xinitrc
      ;;
    cinnamon|mate)
      touch /home/${UserName}/.xinitrc
      echo "exec ${DesktopEnviorment}-session" >> /home/${UserName}/.xinitrc
      ;;
    xfce)
      touch /home/${UserName}/.xinitrc
      echo "exec startxfce4" >> /home/${UserName}/.xinitrc
      ;;
    *)
      touch /home/${UserName}/.xinitrc
      echo "exec ${DesktopEnviorment}" >> /home/${UserName}/.xinitrc
      ;;
  esac
else
  pacman -S --needed --noconfirm ${DisplayManager}
  systemctl enable ${DisplayManager}.service
fi
