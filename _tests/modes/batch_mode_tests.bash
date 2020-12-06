#!/bin/bash

#----------------
# Name          : batch_mode_tests.bash
# Description   : Unit test batch-mode funcionality
#----------------

source "./_src/modes/batch_mode.bash"
source "./_src/messages/errors.bash"

test_batch_mode_with_empty_args() {
  local message="It should throw a missing-function-args error."
  local expected_result=`error_missing_function_args "batch_mode"`
  
  local result=`batch_mode`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

