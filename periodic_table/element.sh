#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

NO_ELEMENT_MESSAGE() {
  echo "I could not find that element in the database."
}

ELEMENT_MESSAGE() {
  echo "The element with atomic number $1 is $2 ($3). It's a $4, with a mass of $5 amu. $2 has a melting point of $6 celsius and a boiling point of $7 celsius."
}

FETCH_ELEMENT() {
  # if argument is a number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # fetch
    FETCH_ELEMENT_RESULT=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number = $1")
    if [[ -z $FETCH_ELEMENT_RESULT ]]
    then
      NO_ELEMENT_MESSAGE
    else
      IFS='|' read -r ATOMIC_NUMBER ATOMIC_NUMBER SYMBOL  NAME  ATOMIC_MASS  MELTING_POINT  BOILING_POINT  TYPE <<< "$FETCH_ELEMENT_RESULT"
      ELEMENT_MESSAGE $ATOMIC_NUMBER $NAME $SYMBOL $TYPE $ATOMIC_MASS $MELTING_POINT $BOILING_POINT
    fi
  # if argument is a symbol
  elif [[ $1 =~ ^[A-Z][a-z]{0,1}$ ]]
  then
    # fetch
    FETCH_ELEMENT_RESULT=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol = '$1'")
    if [[ -z $FETCH_ELEMENT_RESULT ]]
    then
      NO_ELEMENT_MESSAGE
    else
      IFS='|' read -r ATOMIC_NUMBER ATOMIC_NUMBER SYMBOL  NAME  ATOMIC_MASS  MELTING_POINT  BOILING_POINT  TYPE <<< "$FETCH_ELEMENT_RESULT"
      ELEMENT_MESSAGE $ATOMIC_NUMBER $NAME $SYMBOL $TYPE $ATOMIC_MASS $MELTING_POINT $BOILING_POINT
    fi
  # argument is probably a name
  else
    FETCH_ELEMENT_RESULT=$($PSQL "SELECT * FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE name = '$1'")
    if [[ -z $FETCH_ELEMENT_RESULT ]]
    then
      NO_ELEMENT_MESSAGE
    else
      IFS='|' read -r ATOMIC_NUMBER ATOMIC_NUMBER SYMBOL  NAME  ATOMIC_MASS  MELTING_POINT  BOILING_POINT  TYPE <<< "$FETCH_ELEMENT_RESULT"
      ELEMENT_MESSAGE $ATOMIC_NUMBER $NAME $SYMBOL $TYPE $ATOMIC_MASS $MELTING_POINT $BOILING_POINT
    fi
  fi
}

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  FETCH_ELEMENT $1
fi
