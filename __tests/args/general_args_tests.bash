#!/bin/bash

#----------------
# Name          : general_args_tests
# Description   : Unit test functionality for reading general arguments
#----------------

source ./args/general_args.bash
source ./messages/help.bash

test_reading_with_no_args() {
  local message="It should "
  local expected_result=`error_missing_required_arg "mode" "read_general_args"`
  
  local result=`read_general_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_and_mode_is_not_found() {
  local message="It should "
  local mode="test_fake"
  local expected_result=`error_mode_not_found "$mode" "read_general_args"`
  
  local result=`read_general_args -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_mode_short_arg() {
  local message="It should return the configured mode"
  local mode="capture"
  local expected_result="$mode"
  
  local result=`read_general_args -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_mode_long_arg() {
  local message="It should return the configured mode"
  local mode="capture"
  local expected_result="$mode"
  
  local result=`read_general_args --mode "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_short_arg_and_no_mode() {
  local message="It should print the full help menu"
  local expected_result=`print_help_by_mode`
  
  local result=`read_general_args -h`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_long_arg_and_no_mode() {
  local message="It should print the full help menu"
  local expected_result=`print_help_by_mode`
  
  local result=`read_general_args --help`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_short_arg_and_capture_mode() {
  local message="It should print the full help menu"
  local mode="capture"
  local expected_result=`print_help_by_mode "$mode"`
  
  local result=`read_general_args -h -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_short_arg_and_cut_mode() {
  local message="It should print the full help menu"
  local mode="cut"
  local expected_result=`print_help_by_mode "$mode"`
  
  local result=`read_general_args -h -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_short_arg_and_batch_mode() {
  local message="It should print the full help menu"
  local mode="batch"
  local expected_result=`print_help_by_mode "$mode"`
  
  local result=`read_general_args -h -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_short_arg_and_join_mode() {
  local message="It should print the full help menu"
  local mode="join"
  local expected_result=`print_help_by_mode "$mode"`
  
  local result=`read_general_args -h -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_short_arg_and_watch_mode() {
  local message="It should print the full help menu"
  local mode="watch"
  local expected_result=`print_help_by_mode "$mode"`
  
  local result=`read_general_args -h -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_short_arg_and_mode_is_not_found() {
  local message="It should print the full help menu"
  local mode="test_fake"
  local expected_result=`print_help_by_mode`
  
  local result=`read_general_args -h -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

suite_addTest test_reading_with_no_args
suite_addTest test_reading_and_mode_is_not_found
suite_addTest test_reading_with_mode_short_arg
suite_addTest test_reading_with_mode_long_arg
suite_addTest test_reading_with_help_short_arg_and_no_mode
suite_addTest test_reading_with_help_long_arg_and_no_mode
suite_addTest test_reading_with_help_short_arg_and_capture_mode
suite_addTest test_reading_with_help_short_arg_and_cut_mode
suite_addTest test_reading_with_help_short_arg_and_batch_mode
suite_addTest test_reading_with_help_short_arg_and_join_mode
suite_addTest test_reading_with_help_short_arg_and_watch_mode
suite_addTest test_reading_with_help_short_arg_and_mode_is_not_found

