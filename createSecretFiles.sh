#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Should match with the list in deployStack.sh
PASSWORDS=(
      "db-root-pwd"
      'db-user-pwd'
  )

GENERATED_PASSWORDS=($(pwgen -sc 20 ${#PASSWORDS[@]}))

for index in ${!GENERATED_PASSWORDS[@]}
do
  echo ${GENERATED_PASSWORDS[$index]} > $SCRIPT_DIR/secrets/${PASSWORDS[$index]}
done

############################## Other secrets that require no symbols, no numbers, and to be smaller
SECRETS_NO_SYMBOLS=(
      'db-name'
      'db-user'
      'wp-table-prefix'
  )

GENERATED_SECRETS_NO_SYMBOLS=($(pwgen -sc0 8 ${#SECRETS_NO_SYMBOLS[@]}))

for index in ${!GENERATED_SECRETS_NO_SYMBOLS[@]}
do
  echo ${GENERATED_SECRETS_NO_SYMBOLS[$index]} > $SCRIPT_DIR/secrets/${SECRETS_NO_SYMBOLS[$index]}
done

echo "secret files created with random but secure data"
