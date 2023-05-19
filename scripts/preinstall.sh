#!/bin/bash
# This script sets up mirrors and basic packages for the later installation
# Discord: Handy#1684

echo -ne "
######################################################
/  Setting up mirrors and installing basic packages  \\
######################################################
"

pacman -Sy --noconfirm base
pacman -S --noconfirm reflector rsync curl
reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

clear && echo -ne "
#######################################################
/           Disk selection and formating              \\
#######################################################

Choose one of the following drives(!NOTE ALL DATA WILL BE IRREPEREBLY WIPED OFF OF THE SELECTED DRIVE):
"

# N = Index of array
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
select fs in btrfs ext4 xfs
do
  case $fs in
    btrfs)
      Filesystem=btrfs
      break
    ;;
    ext4)
      Filesystem=ext4
      break
    ;;
    xfs)
      Filesystem=xfs
      break
    ;;
    *)
      echo "Not a valid filesystem. Please rechoose"
    ;; 
  esac
done

# Credit: Cong Nguyen https://superuser.com/questions/195598/test-if-element-is-in-array-in-bash
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

echo "Please choose how to format your selected drive"

select install_type in manual automatic
do
  case $install_type in
    manual)
      X=0
      cfdisk
      clear
      echo "Which partition is the root partition?"
      for i in $(lsblk | awk '{print $1}' | sed 's/[\─└├│]//g' | grep ${Disk} | tail -n +2 )
      do
        PartitionArray[$X]="$i"
        let "X= $X + 1"
      done
      select root_partition in "${PartitionArray[@]}"
      do
        if in_array "${root_partition}" "${my_array[*]}"
        then
          mkfs.${Filesystem} /dev/${root_partition}
          break
        else
          echo "Not a valid partition please choose a partition from the list"
        fi


      done
    ;;  
  esac
done

