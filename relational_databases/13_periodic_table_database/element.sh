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

  QUERY_RESULT_EXISTS=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$PARAMETER")
  if [[ -z "$QUERY_RESULT_EXISTS" ]]
  then 
    echo "I could not find that element in the database."
  else
    QUERY_RESULT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$PARAMETER" )
    #Get element basic information from the database and store in array
    readarray -d'|' -t ARR <<< $QUERY_RESULT
  
    #assign to proper variables
    ATOMIC_NUMBER=${ARR[0]} 
    SYMBOL=${ARR[1]} 
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$PARAMETER")
    # Get element properties
    readarray -d'|' -t ARR <<< $($PSQL "SELECT type_id, atomic_mass, melting_point_celsius, boiling_point_celsius  FROM properties WHERE atomic_number=$PARAMETER" ) 
    # assign to proper variables
    TYPE_ID=${ARR[0]} 
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID" )
    ATOMIC_MASS=${ARR[1]} 
    MELTING_POINT_CELSIUS=${ARR[2]} 
    BOILING_POINT_CELSIUS=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER" )  

    #Print requested element information
    echo  "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."

  fi

 
fi


# if argument is one letter
if [[ $PARAMETER =~  ^[A-Za-z]+$ ]]
then
  
  QUERY_RESULT_EXISTS=$($PSQL "SELECT name FROM elements WHERE name LIKE '$PARAMETER%'")
  if [[ -z "$QUERY_RESULT_EXISTS" ]]
  then 
    echo "I could not find that element in the database."
  else

    #Get element basic information from the database and store in array
    readarray -d'|' -t ARR <<< $($PSQL "SELECT * FROM elements WHERE name LIKE '$PARAMETER%'" ) 

    #assign to proper variables
    ATOMIC_NUMBER=${ARR[0]} 
    SYMBOL=${ARR[1]} 
    NAME=$($PSQL "SELECT name FROM elements WHERE name LIKE '$PARAMETER%' LIMIT 1" )
    # Get element properties
    readarray -d'|' -t ARR <<< $($PSQL "SELECT type_id, atomic_mass, melting_point_celsius, boiling_point_celsius  FROM properties WHERE atomic_number=$ATOMIC_NUMBER" ) 
    # assign to proper variables
    TYPE_ID=${ARR[0]} 
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID" )
    ATOMIC_MASS=${ARR[1]} 
    MELTING_POINT_CELSIUS=${ARR[2]} 
    BOILING_POINT_CELSIUS=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER" ) 

    #Print requested element information
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  fi
fi

