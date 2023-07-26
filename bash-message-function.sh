#!/bin/bash

# Define terminal colors
INFO=`tput setaf 33`
SUCCESS=`tput setaf 2`
WARNING=`tput setaf 3`
ERROR=`tput setaf 1`
RESET=`tput sgr0`

INPUT_STATUS="$1"
INPUT_MESSAGE="$2"

function MESSAGE {
  # Message error function; prefix message with ERROR
  function MESSAGE_ERROR {
    echo -e "${ERROR}ERROR${RESET}   $1"
  }
  # Message info function; prefix message with INFO
  function MESSAGE_INFO {
    echo -e "${INFO}INFO${RESET}    $1"
  }
  # Message success function; prefix message with SUCCESS
  function MESSAGE_SUCCESS {
    echo -e "${SUCCESS}SUCCESS${RESET} $1"
  }
  # Message warning function; prefix message with WARNING
  function MESSAGE_WARNING {
    echo -e "${WARNING}WARNING${RESET} $1"
  }

  # Convert arguement to lowercase; set variable
  message_status=$(echo "$1" | awk '{print tolower($0)}')

  # Execute message based on status
  if [ "$message_status" = "error" ]; then
    MESSAGE_ERROR "$2"
  elif [ "$message_status" = "info" ]; then
    MESSAGE_INFO "$2"
  elif [ "$message_status" = "success" ]; then
    MESSAGE_SUCCESS "$2"
  elif [ "$message_status" = "warning" ]; then
    MESSAGE_WARNING "$2"
  fi
}

if [ ! -z "$INPUT_STATUS" ]; then
  MESSAGE "$INPUT_STATUS" "$INPUT_MESSAGE"
fi