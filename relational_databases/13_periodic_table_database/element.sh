#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

PARAMETER=$1

# if no argument is provided
if [[ -z $PARAMETER ]]
then
  echo "Please provide an element as an argument."
fi
# if argument is a number
if [[ $PARAMETER =~ ^[0-9]+$ ]] 
then 
  echo "Is a number!"

  #Get element basic information from the database and store in array
  readarray -d'|' -t ARR <<< $($PSQL "SELECT * FROM elements WHERE atomic_number=$PARAMETER" ) 
  #assign to proper variables
  ATOMIC_NUMBER=${ARR[0]} 
  SYMBOL=${ARR[1]} 
  NAME=${ARR[2]} 
  # Get element properties
  readarray -d'|' -t ARR <<< $($PSQL "SELECT type, atomic_mass, melting_point_celsius, boiling_point_celsius  FROM properties WHERE atomic_number=$PARAMETER" ) 
  # assign to proper variables
  TYPE=${ARR[0]} 
  ATOMIC_MASS=${ARR[1]} 
  MELTING_POINT_CELSIUS=${ARR[2]} 
  BOILING_POINT_CELSIUS=${ARR[3]} 

  #Print requested element information
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."

  # if [[ -z $GET_ELEMENT_BY_NUMBER ]] 
  # then 
  #   echo "I could not find that element in the database."
  # else
  #    echo $GET_ELEMENT_BY_NUMBER
  # fi 
fi

# if argument is one letter
if [[ $PARAMETER =~  ^[A-Z]$ ]]
then
  echo "argument is a letter!"
fi

# if argument is a word
if [[ $PARAMETER =~ ^[A-Za-z]+$ ]]
then
  echo "argument is a word!"
fi
