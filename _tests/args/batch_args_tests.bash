#!/bin/bash

#----------------
# Name          : batch_args_tests.bash
# Project       : digitizer
# Description   : Unit test batch-mode functionality
#----------------

source "./_src/args/batch_args.bash"
source "./_src/messages/help.bash"

test_reading_batch_args_with_input_short_arg() {
  local message="It should return the configured batch_file input."
  local batch_file="MyBatchFile.txt"
  local expected_result="$batch_file"
  
  local result=`read_batch_args -i $batch_file`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_batch_args_with_input_first_long_arg() {
  local message="It should return the configured batch_file input."
  local batch_file="MyBatchFile.txt"
  local expected_result="$batch_file"
  
  local result=`read_batch_args --input $batch_file`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_batch_args_with_input_second_long_arg() {
  local message="It should return the configured batch_file input."
  local batch_file="MyBatchFile.txt"
  local expected_result="$batch_file"
  
  local result=`read_batch_args --batch_file $batch_file`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

