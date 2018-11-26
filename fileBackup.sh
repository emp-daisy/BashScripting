#!/bin/bash
# Backup files
# Jesz 19-11-2018

if [ -z $1 ]
then
  echo File not specified
elif [ -d $1 ]
then
  echo Argument specified is not a file or does not exist
else
  echo Backing up in progress for "$(date +%Y-%m-%d)_$(basename $1)"
  if [ ! -z $2 ] && [ $1 == 'reverse' ]
  then
    FILE=$(basename $1)
    ext="${FILE#*.}"

    extensionDot=$([ -n ext ] && echo .$ext || echo '')

    newPath="$(dirname $1)/$(basename $1  | cut -d. -f 1)_$(date +%Y-%m-%d)$extensionDot"
  else
    newPath="$(dirname $1)/$(date +%Y-%m-%d)_$(basename $1)"
  fi
# basename -s .JPG -a *.JPG | xargs -n1 -i mv {}.JPG {}.jpg
  cp -v $1 $newPath
  echo Copy completed
fi
