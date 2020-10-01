#!/bin/bash

#----------------
# Name          : 
# Description   : 
# Author        : E Fournier
# Dependencies  : 
# Arguments     : 
# Example Usage : 
#----------------

test_() {
  local message="It should "
  local input=""
  local expected_result=""
  
  local result=` "$input"`
  
  assertEquals "$message" "$expected_result" "$result"
}

