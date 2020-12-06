#!/bin/bash

#----------------
# Name          : mode_args_tests.bash
# Project       : digitizer
# Description   : Unit test functionality for reading help arguments
#----------------

source "./_src/args/help_args.bash"
source "./_src/messages/help.bash"

test_reading_help_with_no_args() {
  local message="It should return nothing."
  local expected_result=""
  
  local result=`read_help_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_short_arg_and_no_mode() {
  local message="It should print the full help menu."
  local expected_result=`print_help_by_mode`
  
  local result=`read_help_args -h`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_long_arg_and_no_mode() {
  local message="It should print the full help menu."
  local expected_result=`print_help_by_mode`
  
  local result=`read_help_args --help`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_short_arg_and_capture_mode() {
  local message="It should print the capture-mode help menu."
  local mode="capture"
  local expected_result=`print_help_by_mode "$mode"`
  
  local result=`read_help_args -h -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_short_arg_and_cut_mode() {
  local message="It should print the cut-mode help menu."
  local mode="cut"
  local expected_result=`print_help_by_mode "$mode"`
  
  local result=`read_help_args -h -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_short_arg_and_batch_mode() {
  local message="It should print the batch-mode help menu."
  local mode="batch"
  local expected_result=`print_help_by_mode "$mode"`
  
  local result=`read_help_args -h -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_short_arg_and_join_mode() {
  local message="It should print the join-mode help menu."
  local mode="join"
  local expected_result=`print_help_by_mode "$mode"`
  
  local result=`read_help_args -h -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_short_arg_and_watch_mode() {
  local message="It should print the watch-mode help menu."
  local mode="watch"
  local expected_result=`print_help_by_mode "$mode"`
  
  local result=`read_help_args -h -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_help_short_arg_and_mode_is_not_found() {
  local message="It should print the full help menu."
  local mode="test_fake"
  local expected_result=`print_help_by_mode`
  
  local result=`read_help_args -h -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

