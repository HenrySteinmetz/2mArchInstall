#!/bin/bash

select browser in brave chromium firefox chrome vivaldi
do
  case $browser in 
    brave|chromium|firefox|chrome|vivaldi)
    export Browser=${browser}
      break
    ;;
    *)
      echo "Not a valid browser"
    ;;
  esac
done
