#!/bin/bash

#----------------
# Name          : batch_args_tests
# Description   : Unit test batch-mode funcionality
#----------------

source ./args/batch_args.bash
source ./help/help.bash

test_reading_with_no_args() {
  local message="It should print the help menu"
  local expected_result=`print_help_info`
  
  local result=`read_batch_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_input_short_arg() {
  local message="It should return the configured input"
  local batch_file="MyBatchFile.txt"
  local expected_result="$batch_file"
  
  local result=`read_batch_args -i $batch_file`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_input_first_long_arg() {
  local message="It should return the configured input"
  local batch_file="MyBatchFile.txt"
  local expected_result="$batch_file"
  
  local result=`read_batch_args --input $batch_file`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_input_second_long_arg() {
  local message="It should return the configured input"
  local batch_file="MyBatchFile.txt"
  local expected_result="$batch_file"
  
  local result=`read_batch_args --batch_file $batch_file`
  
  assertEquals "$message" "$expected_result" "$result"
}


suite_addTest test_reading_with_no_args
suite_addTest test_reading_with_input_short_arg
suite_addTest test_reading_with_input_first_long_arg
suite_addTest test_reading_with_input_second_long_arg

