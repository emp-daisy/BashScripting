#!/bin/bash
# Random word generator
# Jesz 18-11-2018


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