#!/bin/bash

#----------------
# Name          : 
# Description   : 
#----------------

source ./utilities/modes.bash
source ./messages/errors.bash

test_is_mode_known_with_no_args() {
  local message="It should throw a missing-function-args error"
  local expected_result=`error_missing_function_args "is_mode_known"`
  
  local result=`is_mode_known`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_is_mode_known_with_unknown_mode() {
  local message="It should "
  local mode="fake_mode"
  local expected_result="false"
  
  local result=`is_mode_known "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_is_mode_known_with_capture_mode() {
  local message="It should "
  local mode="capture"
  local expected_result="true"
  
  local result=`is_mode_known "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_is_mode_known_with_cut_mode() {
  local message="It should "
  local mode="cut"
  local expected_result="true"
  
  local result=`is_mode_known "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_is_mode_known_with_batch_mode() {
  local message="It should "
  local mode="batch"
  local expected_result="true"
  
  local result=`is_mode_known "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_is_mode_known_with_join_mode() {
  local message="It should "
  local mode="join"
  local expected_result="true"
  
  local result=`is_mode_known "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_is_mode_known_with_watch_mode() {
  local message="It should "
  local mode="watch"
  local expected_result="true"
  
  local result=`is_mode_known "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

suite_addTest test_is_mode_known_with_no_args
suite_addTest test_is_mode_known_with_unknown_mode
suite_addTest test_is_mode_known_with_capture_mode
suite_addTest test_is_mode_known_with_capture_mode
suite_addTest test_is_mode_known_with_cut_mode
suite_addTest test_is_mode_known_with_batch_mode
suite_addTest test_is_mode_known_with_join_mode
suite_addTest test_is_mode_known_with_watch_mode

