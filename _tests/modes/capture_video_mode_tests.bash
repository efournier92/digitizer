#!/bin/bash

#----------------
# Name          : capture_mode_tests.bash
# Description   : Unit test capture-mode funcionality
#----------------

source "./_src/modes/capture_mode.bash"
source "./_src/messages/errors.bash"

test_get_capture_command_with_no_aguments() {
  local message="It should "
  local expected_result=`error_missing_function_args "get_capture_command"`
  
  local result=`get_capture_command`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_get_capture_command_with_no_aguments() {
  local message="It should "
  local expected_result=`error_missing_function_args "get_capture_command"`
  
  local result=`get_capture_command`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

