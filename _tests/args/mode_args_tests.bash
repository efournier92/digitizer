#!/bin/bash

#----------------
# Name          : mode_args_tests.bash
# Project       : digitizer
# Description   : Unit test functionality for reading mode arguments
#----------------

source "./_src/args/mode_args.bash"
source "./_src/messages/help.bash"

test_reading_mode_args_mode_args_with_no_args() {
  local message="It should throw a missing-required-arg error."
  local expected_result=`error_missing_required_arg "$mode" "read_mode_args"`
  
  local result=`read_mode_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_mode_args_and_mode_is_not_found() {
  local message="It should throw a mode-not-found error."
  local mode="test_fake"
  local expected_result=`error_mode_not_found "$mode" "read_mode_args"`
  
  local result=`read_mode_args -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_mode_args_with_mode_short_arg() {
  local message="Result should include configured value for mode."
  local mode="capture_video"
  local expected_result="$mode"
  
  local result=`read_mode_args -m "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_mode_args_with_mode_long_arg() {
  local message="Result should include configured value for mode."
  local mode="capture_video"
  local expected_result="$mode"
  
  local result=`read_mode_args --mode "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

