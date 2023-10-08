#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

echo $($PSQL "TRUNCATE TABLE teams, games RESTART IDENTITY")

# Do not change code above this line. Use the PSQL variable above to query your database.

# INSERT VALUES INTO teams TABLE
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # INSERT WINNER
  # exclude "winner" value, since that's the column name
  if [[ $WINNER != "winner" ]]
  then 
    
    # check if the winner team name exists in teams
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER' " )
    
    # insert the name in the 'name' column of the 
    # teams table only if it does not exist already
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES( '$WINNER' )")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
    fi
  fi

  # INSERT OPPONENT
   # exclude "opponent" value, since that's the column name
  if [[ $OPPONENT != "opponent" ]]
  then 
    
    # check if the winner team name exists in teams
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT' " )
    
    # insert the name in the 'name' column of the 
    # teams table only if it does not exist already
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES( '$OPPONENT' )")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    fi
  fi

  
done


# INSERT VALUES INTO games TABLE
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #Exclude the first column
  if [[ $YEAR != 'year' ]]
  then
  
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER' " )
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT' " )

    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(winner_id, opponent_id, year, round, winner_goals, opponent_goals) VALUES($WINNER_ID, $OPPONENT_ID, '$YEAR', '$ROUND', '$WINNER_GOALS', '$OPPONENT_GOALS' )" )
    if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
    then 
      echo "Inserted game with ids#: $WINNER_ID vs. $OPPONENT_ID "
    fi
  fi

done
