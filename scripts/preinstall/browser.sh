#!/bin/bash

select browser in brave chromium firefox chrome vivaldi
do
  case $browser in 
    brave|chromium|firefox|chrome|vivaldi)
      echo "Browser=${browser}" >> ${SCRIPT_DIR}/vars.sh
      break
    ;;
    *)
      echo "Not a valid browser"
    ;;
  esac
done
