#!/bin/bash
# Random word generator
# Jesz 18-11-2018

# pass reverse ad second argument to get the date after file name

randomDoc=/usr/share/dict/words
length=$1

wordList() {
  if [ -z $1 ]
  then
    echo $( cat $randomDoc | grep -E "^\S{$length}$" )
  else
    echo $( cat $randomDoc )
  fi
}

if [ -z $1 ]
then
  wordCount=$( wordList | wc -w )
  randomNum=$(( RANDOM % wordCount ))
else
  wordCount=$( cat $randomDoc | wc -w )
  randomNum=$(( RANDOM % wordCount ))
fi

randomWord=$( wordList | cut -d ' ' -f $randomNum )
echo Random word: $randomWord


# Challenge: Now see if you can expand the previous question to accept a list of files on the command line and it will create a named copy of all of them. (The command xargs may be useful here.).