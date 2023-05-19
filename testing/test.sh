#!/bin/bash
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
