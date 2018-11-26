#!/bin/bash
# Greeting for the day
# Jesz 20-11-2018

day=$( date +%A)

case $day in
  Monday)
    echo Stressful monday
    ;;
  Tuesday)
    echo Just tuesday
    ;;
  Wednesday)
    echo Happy Hump day
    ;;
  Thursday)
    echo TGIT
    ;;
  Friday)
    echo TGIF
    ;;
  Saturday)
    echo Restful saturday
    ;;
  Sunday)
    echo Happy sunday
    ;;
  *)
    echo Not a day
    ;;
esac