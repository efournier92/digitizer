#!/bin/bash

#----------------
# Name          : timestamps_tests.bash
# Description   : Unit test timestamps funcionality
#----------------

source "./_src/utils/timestamps.bash"
source "./_src/messages/errors.bash"

test_correct_negatives_with_value_carrying() {
  local message="It should "
  local hours="1"
  local minutes="0"
  local seconds="0"
  local ms="-111"
  local expected_result="00:59:59.889"
  
  local result=`correct_timestamp_negatives "$hours" "$minutes" "$seconds" "$ms"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_correct_negatives_without_value_carrying() {
  local message="It should "
  local hours="2"
  local minutes="2"
  local seconds="2"
  local ms="222"
  local expected_result="02:02:02.222"
  
  local result=`correct_timestamp_negatives "$hours" "$minutes" "$seconds" "$ms"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_subtract_timestamps_without_value_carrying() {
  local message="It should return the expected value"
  local start_time="11:11:11.111"
  local end_time="33:33:33.333"
  local expected_result="22:22:22.222"
  
  local result=`subtract_timestamps "${start_time}" "${end_time}"`
  
  assertEquals "${message}" "${expected_result}" "${result}"
}

test_subtract_timestamps_with_value_carrying() {
  local message="It should return the expected value"
  local start_time="00:01:55.444"
  local end_time="00:09:03.333"
  local expected_result="00:07:07.889"
  
  local result=`subtract_timestamps "${start_time}" "${end_time}"`
  
  assertEquals "${message}" "${expected_result}" "${result}"
}

test_subtract_timestamps_with_double_value_carrying() {
  local message="It should return the expected value"
  local start_time="00:50:55.888"
  local end_time="01:20:03.999"
  local expected_result="00:29:08.111"
  
  local result=`subtract_timestamps "${start_time}" "${end_time}"`
  
  assertEquals "${message}" "${expected_result}" "${result}"
}

test_pad_value_with_missing_args() {
  local message="It throw a missing-function-args error"
  local expected_result=`error_missing_function_args "pad_timestamp_value"`

  local result=`pad_timestamp_value "$value" "$digits"`
  
  assertEquals "${message}" "${expected_result}" "${result}"
}

test_pad_value() {
  local message="It should return the expected value"
  local value="1"
  local digits="2"
  local expected_result="01"

  local result=`pad_timestamp_value "$value" "$digits"`
  
  assertEquals "${message}" "${expected_result}" "${result}"
}

test_pad_value_with_missing_args() {
  local message="It throw a missing-function-args error"
  local expected_result=`error_missing_function_args "pad_timestamp_value"`
  
  local result=`pad_timestamp_value "$value" "$digits"`
  
  assertEquals "${message}" "${expected_result}" "${result}"
}

. ./bin/shunit2

