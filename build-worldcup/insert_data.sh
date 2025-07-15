#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams")
echo $($PSQL "DROP TABLE games, teams")
echo $($PSQL "CREATE TABLE games()")
echo $($PSQL "CREATE TABLE teams()")

echo $($PSQL "ALTER TABLE teams ADD COLUMN team_id SERIAL, ADD PRIMARY KEY(team_id), ADD COLUMN name VARCHAR(30) UNIQUE")
echo $($PSQL "ALTER TABLE teams ALTER COLUMN name SET NOT NULL")


echo $($PSQL "ALTER TABLE games ADD COLUMN game_id SERIAL, ADD PRIMARY KEY(game_id), ADD COLUMN year INT, ADD COLUMN round VARCHAR(100)")
echo $($PSQL "ALTER TABLE games ADD COLUMN winner_id INT REFERENCES teams(team_id), ADD COLUMN opponent_id INT REFERENCES teams(team_id)")
echo $($PSQL "ALTER TABLE games ADD COLUMN winner_goals INT, ADD COLUMN opponent_goals INT")
echo $($PSQL "ALTER TABLE games ALTER COLUMN year SET NOT NULL, ALTER COLUMN round SET NOT NULL, ALTER COLUMN winner_id SET NOT NULL, ALTER COLUMN opponent_id SET NOT NULL, ALTER COLUMN winner_goals SET NOT NULL, ALTER COLUMN opponent_goals SET NOT NULL")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS OPP_GOALS
do 

  if [[ $WINNER != 'winner' || $OPPONENT != 'opponent' ]]
  then
    TEAM_WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    if [[ -z $TEAM_WINNER_ID ]]
    then
      echo $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      TEAM_WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    TEAM_OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    if [[ -z $TEAM_OPPONENT_ID ]]
    then
      echo $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      TEAM_OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $TEAM_WINNER_ID, $TEAM_OPPONENT_ID, $W_GOALS, $OPP_GOALS)")
  fi

done
