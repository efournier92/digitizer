#!/bin/bash

#----------------
# Name          : watch_mode_tests.bash
# Description   : Unit test watch-mode funcionality
#----------------

test_() {
  local message="It should "
  local input=""
  local expected_result=""
  
  local result=``
  
  assertEquals "$message" "$expected_result" "$result"
}

