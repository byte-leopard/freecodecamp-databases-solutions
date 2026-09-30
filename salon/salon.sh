#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

HANDLE_CUSTOMER() {
  SERVICE_ID_SELECTED=$1

  # get customer phone number
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE' ")

  # create customer name if not found
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "You are new customer. What is your name?"
    read CUSTOMER_NAME

    INSERT_CUSTOMER_NAME_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  # get customer id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # get service time
  echo -e "\nWhen would you like to take a service?"
  read SERVICE_TIME

  # create an appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  # get service name
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
  # confirm 
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

SERVICES() {
  echo -e "\nList of services"

  GET_SERVICES_RESULT=$($PSQL "SELECT service_id, name FROM services")

  echo "$GET_SERVICES_RESULT" | while IFS='|' read SERVICE_ID SERVICE_NAME
  do
    echo -e "$SERVICE_ID) $SERVICE_NAME"
  done

  echo -e "\nChoose the service number:"

  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    echo "Not a valid service number."
    SERVICES
  else
    # does the service exist?
    CHOSEN_SERVICE_RESULT=$($PSQL "SELECT * FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
    
    if [[ -z $CHOSEN_SERVICE_RESULT ]]
    then
      echo -e "\nNot a valid service number."
      SERVICES
    else HANDLE_CUSTOMER $SERVICE_ID_SELECTED
    fi
  fi
}

SERVICES
