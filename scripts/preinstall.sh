#!/bin/bash
# This script sets up mirrors and basic packages for the later installation
# Discord: Handy#1684

echo -ne "
######################################################
/  Setting up mirrors and installing basic packages  \\
######################################################
"

pacman -Sy base
pacman -S --noconfirm reflector rsync curl
reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
clear && echo -ne "
#######################################################
/           Disk selection and formating              \\
#######################################################

Choose one of the following drives(!NOTE ALL DATA WILL BE IRREPEREBLY WIPED OFF OF THE SELECTED DRIVE):
"
N=0
for i in $(lsblk | awk '{print $1}' | sed '/[\─└├│]/d' | awk NF | tail -n +2 ); do
  array[$N]="$i"
  let "N= $N + 1"
done

select opt in "${array[@]}"
do
  if [ -z "${opt}" ]; then
    echo "Invalid disk please pick a valid drive"
  else
    echo "You chose /dev/${opt} is this choice correct? (y/N)"
    read -p ":" correct 
    case $correct in
      y)
        Disk=${opt}
        break
      ;;
      
      Y)
        Disk=${opt}
        break
      ;;
      
      *)
        echo "Please rechoose your disk"
      ;;
    esac
  fi
done

echo "Please choose your desired filesystem"
select fs in "btrfs" "ext4 recommended" "xfs"
do
  case $fs in
    1)
      Filesystem=btrfs
      break
    ;;
    2)
      Filesystem=ext4
      break
    ;;
    3)
      Filesystem=xfs
      break
    ;;
    *)
      echo "Not a valid filesystem. Please rechoose"
    ;; 
  esac
done

echo "Please choose how to format your selected drive"

select install_type in manual automatic
do

  case install_type in
    1)
      X=0
      cfdisik
      echo "Which partition is the root partition?"
      for i in $(lsblk | awk '{print $1}' | sed 's/[\─└├│]//g' | grep ${Disk} | tail -n +2 )
      do
        PartitionArray[$X]="$i"
        let "X= $X + 1"
      done
      select root_partition in "${PartitionArray[@]}"
      do
        PartitionArrayLength=${#a[@]}
        inrange=0
        for ((i=1;i<=PartitionArrayLength;i++))
        do
          if [ $root_partition = $i ]
          then
            inrange=1
          fi
        done
        if [ $inrange = 1 ]
        then
         echo "succes"
         #mkfs.${Filesystem} /dev/${}
        fi
      done
    ;;  
  esac
done

