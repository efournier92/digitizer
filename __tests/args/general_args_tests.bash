#!/bin/bash

#----------------
# Name          : general_args_tests
# Description   : Unit test functionality for reading general arguments
#----------------

source ./args/general_args.bash
source ./help/help.bash

test_reading_with_no_args() {
  local message="It should print the help menu"
  local expected_result=`print_help_info`
  
  local result=`read_general_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_mode_short_arg() {
  local message="It should return the configured mode"
  local mode="test_mode"
  local expected_result="$mode"
  
  local result=`read_general_args -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_mode_long_arg() {
  local message="It should return the configured mode"
  local mode="test_mode"
  local expected_result="$mode"
  
  local result=`read_general_args --mode "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}


test_reading_with_help_short_arg() {
  local message="It should print the help menu"
  local expected_result=`print_help_info`
  
  local result=`read_general_args -h`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_long_arg() {
  local message="It should print the help menu"
  local expected_result=`print_help_info`
  
  local result=`read_general_args --help`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_mode_and_help_short_args() {
  local message="It should print the help menu"
  local mode="test_mode"
  local expected_result=`print_help_info`
  
  local result=`read_general_args -m "$mode" -h`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_mode_and_help_long_args() {
  local message="It should print the help menu"
  local mode="test_mode"
  local expected_result=`print_help_info`
  
  local result=`read_general_args --mode "$mode" --help`
  
  assertEquals "$message" "$expected_result" "$result"
}

suite_addTest test_reading_with_no_args
suite_addTest test_reading_with_mode_short_arg
suite_addTest test_reading_with_mode_long_arg
suite_addTest test_reading_with_help_short_arg
suite_addTest test_reading_with_help_long_arg
suite_addTest test_reading_with_mode_and_help_short_args
suite_addTest test_reading_with_mode_and_help_long_args

