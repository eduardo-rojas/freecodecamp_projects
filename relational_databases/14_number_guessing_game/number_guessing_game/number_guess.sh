#!/bin/bash

echo -e "\n~~~~~ Number Guessing Game ~~~~~\n"

echo -e "\nEnter your username:"
read USER_NAME

# WRITE DB QUERY HERE
#if user is found in the database 
echo -e "\nWelcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses."

# WRITE DB QUERY HERE
#if user is not found in the database
echo -e "\nWelcome, <username>! It looks like this is your first time here."

#Generate a random number between 1 and 1000 here:


#Request a number 
echo -e "\nGuess the secret number between 1 and 1000:"

#Provide advise to guess the number here:
#if input is lower than random number

#if input is greater than random number


#if input is equal to random number
echo -e "\nYou guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!"