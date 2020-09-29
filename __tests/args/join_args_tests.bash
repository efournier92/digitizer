#!/bin/bash

#----------------
# Name          : join_args_tests
# Description   : Unit test reading arguments for join mode
#----------------

test_() {
  local message="It should "
  local input=""
  local expected_result=""
  
  local result=` "$input"`
  
  assertEquals "$message" "$expected_result" "$result"
}

