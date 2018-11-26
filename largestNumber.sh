#!/bin/bash
# Get the largest of two numbers
# Jesz 20-11-2018


if [ $# -lt 2 ]
then
  echo Invaild argument
elif [ $1 -gt $2 ]
then
  echo Largest number $1
else
  echo Largest number $2
fi
