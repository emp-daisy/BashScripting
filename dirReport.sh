#!/bin/bash
# Report for directory passed
# Jesz 18-11-2018

if [ $# -eq 0 ]
then
  echo No argument passed
elif [ ! -d $1 ]
then
  echo Argument is not a directory
else
  echo DIRECTORY Report for $1
  echo ===========================================================
  echo
  fileCount=$( find . -type f | wc -l )
  # fileCount=$( ls $1 | wc -l )
  # dirCount=$( ls -d $1 | wc -l )
  dirCount=$( find . -type d | wc -l )
  biggestFile=$( ls -S $1 | head -1 )
  recentFile=$( ls -t $1 | head -1 )
  # ownerList=$( ls -l $1| tail -n +2 | cut -d ' ' -f 4 | uniq -c  | tr -s ' '  | cut -d ' ' -f 3 )
  ownerList=$( ls -l $1| tail -n +2 | cut -d ' ' -f 4 | uniq -c  | awk '{print $2}' )

  echo Number of files in directory : $fileCount
  echo Number of directory in directory : $dirCount
  echo Biggest file : $biggestFile
  echo Most recently modified/created file : $recentFile
  echo List of file owners : $ownerList
fi