#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# clear the tables
TRUNCATE_RESULT=$($PSQL "TRUNCATE TABLE games, teams")
echo $TRUNCATE_RESULT

TEAMS=("France" "Croatia" "Belgium" "England" "Russia" "Brazil" "Sweden" "Japan" "Switzerland" "Mexico" "Netherlands" "Uruguay" "Portugal" "Argentina" "Germany" "Colombia" "Chile" "Nigeria" "Algeria" "United States" "Denmark" "Spain" "Greece" "Costa Rica")

# insert teams into the table
for TEAM in "${TEAMS[@]}";
do
  INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$TEAM')")
done

cat games.csv | while IFS="," read YEAR ROUND WINNER_TEAM OPPONENT_TEAM WINNER_GOALS OPPONENT_GOALS;
do
  # get winner team id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER_TEAM'")
  # get opponent team id
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT_TEAM'")
  # insert game
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES('$YEAR', '$ROUND', '$WINNER_GOALS', '$OPPONENT_GOALS', '$WINNER_ID', '$OPPONENT_ID') ")
done


