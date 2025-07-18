#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU() {
  while true
  do
    echo -e "\nList of services:"
    SERVICE=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

    echo "$SERVICE" | while read ID BAR NAME
    do
      echo "$ID) $NAME"
    done

    echo -e "\nWhat service do you want?\n"
    read SERVICE_ID_SELECTED

    SERVICE_SELECTED=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")

    if [[ -z $SERVICE_SELECTED ]]
    then
      echo -e "\nInvalid service. Please choose again."
    else
      echo -e "\nWhay do you phone number?"
      read CUSTOMER_PHONE

      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

      if [[ -z $CUSTOMER_ID ]]
      then
        echo -e "\nWhay do you name?"
        read CUSTOMER_NAME

        INSERT_CUSTOMER=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      fi

      echo -e "\nWhat time would you like to book the appointment?"
      read SERVICE_TIME

      INSERT_TIME=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
      
      echo "I have put you down for a $(echo "$SERVICE_NAME" | sed 's/^ *//') at $SERVICE_TIME, $(echo "$CUSTOMER_NAME" | sed 's/^ *//')."
      break;
    fi
  done
}

MAIN_MENU