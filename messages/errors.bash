#!/bin/bash

#----------------
# Name          : 
# Description   : 
# Author        : E Fournier
# Dependencies  : 
# Arguments     : 
# Example Usage : 
#----------------

error_missing_function_args() {
  local error_function="$1"

  echo "ERROR: Arguments missing from called function $error_function"

  exit
}

error_join_file_missing() {
  local join_file="$1"

  echo "ERROR: File to join does $join_file"

  exit
}

