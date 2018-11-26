#!/BIN/bash
# A simple demonstration of using backticks
# Jesz 18/11/2018

name='Empress'

echo Author: $name
echo

echo $0 script: There are $# number of line arguement and they are $*.

lines=`cat $1 | wc -l`
echo The number of lines in the file $1 is $lines

exit;
