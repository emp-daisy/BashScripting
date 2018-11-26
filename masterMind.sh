#!/bin/bash

# Master mind gaming terminal v1.0

shuffle() {
   local i tmp size max rand

   size=${#colorBox[*]}
   max=$(( 32768 / size * size ))

   for ((i=size-1; i>0; i--)); do
      while (( (rand=$RANDOM) >= max )); do :; done
      rand=$(( rand % (i+1) ))
      tmp=${colorBox[i]} colorBox[i]=${colorBox[rand]} colorBox[rand]=$tmp
   done
}

array_contains() {
    local searchTerm="$1"
    shift 1;
    local array=( "$@" )

    for v in "${array[@]}"
    do
        if [ "$v" == "$searchTerm" ]; then
            return 0;
        fi
    done
   return 1;
}

main (){
  echo ========== Welcome to my Mastermind game ==========
  echo Author: Jesz

  # colorBox=[red orange yellow blue green purple indigo violet]
  colors=('red' 'orange' 'yellow' 'blue' 'green' 'purple' 'indigo' 'violet')
  colorBox=('r' 'o' 'y' 'b' 'g' 'p' 'i' 'v')
  trial=1
  rounds=8

  echo Color available are: "${colors[@]}"
  echo Game colors are represented by color code: "${colorBox[@]}"
  echo $'\nYou have 8 trials to break the code \n'
  echo $'***** Code is made up of 5 colors *****\n'
  echo $'Hint: \n  B - Right color and position \n  W - Right color but wrong position \n  X - Wrong color and postion \n'

  # shuffling array
  shuffle

  # Game random code
  code=(${colorBox[@]:0:5})
  gameWon=false
  confirmEntry=N
  clue=() #Black, White or no clue

  echo GAME STARTED

  while [[ $trial -le $rounds && $gameWon == false ]]
  do
    echo ================================================
    echo
    echo '>>>>>' ROUND $trial of $rounds '<<<<<'
    echo

    # Loop until user confirms input
    until [[ $confirmEntry =~ ^Y|y$ ]]
    do
      # collect user output
      read -p "Crack the code (no spaces):"  userEntry
      if [[ ! "$userEntry" =~ ^[A-Za-z]{5}$ ]]
      then
        echo Invalid entry
        continue
      fi

      # confirm response
      read -p "Confirm response (Y/N):"  confirmEntry
    done

    # Reset confirm variable
    confirmEntry=N
    let trial++
    clue=()

    # Split input
    for (( i=0 ; i < ${#userEntry} ; i++ )) {
      splitUserInput[$i]=${userEntry:i:1}
    }

    # Compare input with code and sort
    clue=( $( for ((colorIndex=0; colorIndex<${#code[@]}; colorIndex++))
                do
                  if [[ ${code[colorIndex]} == ${splitUserInput[colorIndex]} ]]
                  then
                    # color exists and postion correct
                    echo B
                  elif  array_contains "${code[colorIndex]}"  "${splitUserInput[@]}"
                  then
                    # color exists
                    echo W
                  else
                    # non color and position
                    echo X
                  fi
                done | sort ) )

    # Check if user won
    if array_contains "X" "${clue[@]}"  || array_contains "W" "${clue[@]}"
    then
      echo Hint : "${clue[@]}"
      continue
    else
      gameWon=true
      break
    fi

  done


  echo
  echo ===========================================
  # Check if user won
  if [ $gameWon = true ]
  then
    echo Game Won
  else
    echo Game Lost
    echo Correct code color is  "${code[@]}"
  fi
  echo ===========================================
}

main