#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -q -c"

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME

USERNAME=$(echo "$USERNAME" | cut -c1-22)

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';" | sed 's/^ *//;s/ *$//')

if [[ $USER_ID ]]
then
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE user_id = $USER_ID;" | sed 's/^ *//;s/ *$//')
    BEST_GAME=$($PSQL "SELECT best_game FROM games WHERE user_id = $USER_ID;" | sed 's/^ *//;s/ *$//')
    GAMES_PLAYED=${GAMES_PLAYED:-0}
    BEST_GAME=${BEST_GAME:-0}
    
    echo "Welcome back, $(echo "$USERNAME" | sed 's/^ *//;s/ *$//')! You have played $(echo "$GAMES_PLAYED" | sed 's/^ *//;s/ *$//') games, and your best game took $(echo "$BEST_GAME" | sed 's/^ *//;s/ *$//') guesses."

else
    $PSQL "INSERT INTO users(username) VALUES('$USERNAME');"
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';" | sed 's/^ *//;s/ *$//')
    
    echo "Welcome, $(echo "$USERNAME" | sed 's/^ *//;s/ *$//')! It looks like this is your first time here."
    
    $PSQL "INSERT INTO games(user_id, games_played, best_game) VALUES($USER_ID, 0, 0);"
fi

NUMBER_OF_GUESSES=0
echo "Guess the secret number between 1 and 1000:"

while true
do
    read GUESS
    
    if ! [[ $GUESS =~ ^[0-9]+$ ]]
    then
        echo "That is not an integer, guess again:"
        continue
    fi
    
    (( NUMBER_OF_GUESSES++ ))
    
    if (( GUESS == SECRET_NUMBER ))
    then

        echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
        CURRENT_GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE user_id = $USER_ID;" | sed 's/^ *//;s/ *$//')
        CURRENT_BEST_GAME=$($PSQL "SELECT best_game FROM games WHERE user_id = $USER_ID;" | sed 's/^ *//;s/ *$//')
        
        ((NEW_GAMES_PLAYED = CURRENT_GAMES_PLAYED + 1))
        
        if (( CURRENT_BEST_GAME == 0 || NUMBER_OF_GUESSES < CURRENT_BEST_GAME ))
        then
            NEW_BEST_GAME=$NUMBER_OF_GUESSES
        else
            NEW_BEST_GAME=$CURRENT_BEST_GAME
        fi
        
        $PSQL "UPDATE games SET games_played = $NEW_GAMES_PLAYED, best_game = $NEW_BEST_GAME WHERE user_id = $USER_ID;"
        
        break
        elif (( GUESS > SECRET_NUMBER ))
        then
            echo "It's lower than that, guess again:"
    else
        echo "It's higher than that, guess again:"
    fi
done
