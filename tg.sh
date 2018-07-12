#!/bin/bash
#Script to message group telegram on CLI
#tribeiros@indracompany.com

# with query above, we get every data for variables
#https://api.telegram.org/bot<botToken>/getUpdates

#Variables 
URL=https://api.telegram.org/ #telegram uri
botToken=bot535199740:AAGhxdpQz5XDW8oSD8JYdpE0aRdXdUZwRrU #xtgxbot made with botfather
ansibleGroup=(-272973710 ansible) #array with chat_id and name
indraGroup=(-242284498 indra) #array with chat_id and name
testGroup=(-220750192 test) #array with chat_id and name
GROUP=$1 # first argument set group
MSG=$2 # second argument set message

#Validating user arguments
#here we test if all arguments are defined
if [[ ! $2 ]]; then
  echo "missing arguments"
  exit
fi

#validating groups
# function for validate names of groups and define each for curl command
sendMessage() {
  if [[ "$GROUP" == *"${testGroup[1]}"* ]] ;then
    chatId=${testGroup[0]}
  elif [[ "$GROUP" == *"${indraGroup[1]}"* ]] ;then
    chatId=${indraGroup[0]}
  else
    chatId=${ansibleGroup[0]}
  fi
curl -s -X POST "${URL}${botToken}/sendMessage" -d "chat_id=${chatId}&text=${MSG}" > /dev/null
}

#execute function
sendMessage
