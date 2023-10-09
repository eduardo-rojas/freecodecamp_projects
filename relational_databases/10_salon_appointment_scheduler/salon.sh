#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Super Salon Styles ~~~~~\n"

SERVICES=$($PSQL "SELECT service_id, name FROM services ")

# Display a numbered list of the services
MENU(){
  echo "Please choose a service: "
  #Print available services
  echo -e $SERVICES | sed "s/ |/)/g " 
  read SERVICE_ID_SELECTED
  #function call to create an appointment if the service id is valid
  CREATE_APPOINTMENT
}
#Create appointment
CREATE_APPOINTMENT(){

  VALIDATE_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED " )

  if [[ -z $VALIDATE_SERVICE ]]
  then
    MENU "Enter a valid option."
  else
    # echo "create appointment $VALIDATE_SERVICE."
    echo "Enter your phone number: "
    read CUSTOMER_PHONE
    
    VALIDATE_PHONE=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'" )
    
    if [[ -z $VALIDATE_PHONE ]]
    then
      echo "Enter your name: "
      read CUSTOMER_NAME

      echo "Enter service time: "
      read SERVICE_TIME

      

      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE' ,'$CUSTOMER_NAME')")
    else
      CUSTOMER_NAME=$VALIDATE_PHONE
      
      echo "Enter service time: "
      read SERVICE_TIME
      
    fi
    
      # # Get customer ID
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME' ")

      # #Insert new appointment
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES( $CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME') " )
      echo "I have put you down for a $VALIDATE_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."


  fi


}


MENU