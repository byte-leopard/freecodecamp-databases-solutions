#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRET_NUMBER=$((RANDOM % 1000 + 1))
GUESSES=1

SAVE_USER_GAMES() { 
  INSERT_USER_GAMES_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($1, $2)")
}

GAME_LOOP() {
  echo "Guess the secret number between 1 and 1000:"
  read GUESS

  while [[ ! $GUESS =~ ^([1-9][0-9]{0,3}|1000)$ ]]
  do
    echo "That is not an integer, guess again:"
    GUESSES=$(($GUESSES + 1))
    read GUESS
  done

  while [[ $GUESS -ne $SECRET_NUMBER ]]
  do
    GUESSES=$(($GUESSES + 1))

    if [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      read GUESS
    else
      echo "It's higher than that, guess again:"
      read GUESS      
    fi
  done

  SAVE_USER_GAMES $1 $GUESSES
  echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
   
}

echo "Enter your username:"
read USERNAME

# check username in database
GET_USER_RESULT=$($PSQL "SELECT * FROM users WHERE name='$USERNAME'")

if [[ -z $GET_USER_RESULT ]]
then
  # username is not in database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES ('$USERNAME')")

  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  if [[ -n $INSERT_USER_RESULT ]]
  then
    GET_USER_RESULT=$($PSQL "SELECT * FROM users WHERE name='$USERNAME'")

    IFS='|' read -r USER_ID USERNAME <<< $GET_USER_RESULT
    GAME_LOOP $USER_ID
  fi
else
  # username is in database
  IFS='|' read -r USER_ID USERNAME <<< $GET_USER_RESULT

  USER_GAMES=$($PSQL "SELECT COUNT(g.user_id), MIN(g.guesses), u.name FROM games AS g JOIN users AS u USING(user_id) WHERE g.user_id='$USER_ID' GROUP BY u.user_id, u.name")

  IFS='|' read -r GAMES_COUNT BEST_GAME USERNAME <<< $USER_GAMES

  echo "Welcome back, $USERNAME! You have played $GAMES_COUNT games, and your best game took $BEST_GAME guesses."
  GAME_LOOP $USER_ID
fi
