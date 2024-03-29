#!/bin/bash
# All disk options
# Discord: Handy#1684
# Github: https://github.com/HenrySteinmetz

source ${SCRIPT_DIR}/vars.conf

clear
echo -ne "
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
      y|Y)
        echo "Disk=${opt}" >> ${SCRIPT_DIR}/vars.conf
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
    btrfs|ext4|xfs)
      echo "Filesystem=${fs}" >> ${SCRIPT_DIR}/vars.conf
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
      umount -R /mnt > /dev/null
      cfdisk
      clear
      echo "Which partition is the root partition?"
      for i in $(lsblk | awk '{print $1}' | sed 's/[\─└├│]//g' | grep ${opt} | tail -n +2 )
      do
        PartitionArray[$X]="$i"
        let "X= $X + 1"
      done
      select root_partition in "${PartitionArray[@]}"
      do
        if in_array "${root_partition}" "${PartitionArray[*]}"
        then
          echo "RootPartition=${root_partition}" >> ${SCRIPT_DIR}/vars.conf
          break
        else
          echo "Not a valid partition please choose a partition from the list"
        fi
      done
      echo "Which partition is the boot partition?"
      select boot_partition in "${PartitionArray[@]}"
      do
        if in_array "${boot_partition}" "${PartitionArray[*]}"
        then
          echo "BootPartition=${boot_partition}" >> ${SCRIPT_DIR}/vars.conf
          break
        else
          echo "Not a valid partition please choose a partition from the list"
        fi
      done
      echo $opt
      read -p "Do you have a home partition? (y/N) " YesNo
      case $YesNo in
        y|Y)
          select home_partition in "${PartitionArray[@]}"
          do
            if in_array "${home_partition}" "${PartitionArray[*]}"
            then
              echo "HomePartition=${home_partition}" >> ${SCRIPT_DIR}/vars.conf
              break
            else
            echo "Not a valid partition please choose a partition from the list"
            fi
          done
          export Home="Yes"
        ;;
        n|N)
          export Home="No"
          break
        ;;
        *)
          read -p "Please enter a valid response(y/N)" YesNo
        ;;
      esac
      echo "PartitioningStyle=${install_type}" >> ${SCRIPT_DIR}/vars.conf
      break
    ;;

    automatic)
      echo "PartitioningStyle=${install_type}" >> ${SCRIPT_DIR}/vars.conf
      break
    ;;
  esac
done
