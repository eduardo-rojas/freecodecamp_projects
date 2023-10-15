#!/bin/bash

#Connect to database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo -e "\n~~~~~ Number Guessing Game ~~~~~\n"



echo -e "\nEnter your username:"
read USER_NAME

#Query username in the database
USERNAME_QUERY_RESULT=$($PSQL "SELECT username FROM records WHERE username='$USER_NAME'")||USERNAME_QUERY_RESULT=

if [[ ! -z $USERNAME_QUERY_RESULT  ]]
then
  #if user is found in the database 
  GAMES_PLAYED=$($PSQL  "SELECT games_played FROM records WHERE username='$USER_NAME'")
  BEST_GAME=$($PSQL "SELECT best_score FROM records WHERE username='$USER_NAME'")
  echo -e "\nWelcome back, $USERNAME_QUERY_RESULT! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  #if user is not found in the database
  echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."
  BEST_GAME=0
  GAMES_PLAYED=0
  #Save new user to database
  INSERT_NEW_USER_RESULT=$($PSQL "INSERT INTO records(username, games_played, best_score) VALUES('$USER_NAME', $BEST_GAME, $GAMES_PLAYED)")
fi

#Generate a random number between 1 and 1000 here:
#Create random number
RANGE=1000
RANDOM_NUMBER=$(shuf -i 1-1000 -n 1)
#Create variable to store number of guesses
NUMBER_OF_GUESSES=0

#Request a number 
echo -e "\nGuess the secret number between 1 and 1000:"
read USER_GUESS

#If user enters invalid value
while [[ ! "$USER_GUESS" =~ ^[0-9]+$ ]]
do
  echo -e "\nThat is not an integer, guess again:"
  read USER_GUESS
done
#count first miss
if [ $USER_GUESS -ne $RANDOM_NUMBER ];
then
  (( NUMBER_OF_GUESSES+= 1 ))
fi



while [ $USER_GUESS -ne $RANDOM_NUMBER ]
do
  
  #if input is lower than random number
  #Provide advise to guess the number here:
  if [ $USER_GUESS -gt $RANDOM_NUMBER ];
  then 
    (( NUMBER_OF_GUESSES+= 1 ))
    echo -e "\nIt's lower than that, guess again:"
    read USER_GUESS
    
  fi
  if [ $USER_GUESS  -lt $RANDOM_NUMBER ];
  then
    (( NUMBER_OF_GUESSES+= 1 ))
    echo -e "\nIt's higher than that, guess again:"
    read USER_GUESS
  fi
  #if input is equal to the random number exit the loop
done
#Output results 
echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
#Save Results to Database
(( GAMES_PLAYED+= 1 ))
if [ $NUMBER_OF_GUESSES -gt  $BEST_GAME ];
then 
  BEST_GAME=$NUMBER_OF_GUESSES
fi
PREVIOUS_GAMES=$($PSQL "SELECT games_played FROM records WHERE username='$USER_NAME'" )
GAMES_PLAYED=$PREVIOUS_GAMES+1
SAVE_GAME_RESULTS=$($PSQL "UPDATE records SET games_played = $GAMES_PLAYED , best_score = $BEST_GAME  WHERE username='$USER_NAME'" )
