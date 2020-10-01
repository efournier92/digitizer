#!/bin/bash

#----------------
# Name          : join_args_tests
# Description   : Unit test reading arguments for join mode
#----------------

source ./args/join_args.bash
source ./messages/help.bash
source ./constants/defaults.bash

test_reading_join_args_with_one_input() {
  local message="It should "
  local output_name="TestJoin"
  local expected_result="test1.mp4 `default_output_directory` $output_name"
  
  local result=`read_join_args -o $output_name -i "test1.mp4"`
  
  assertEquals "$message" "$expected_result" "$result"
}


test_reading_join_args_with_two_inputs() {
  local message="It should "
  local output_name="TestJoin"
  local expected_result="test1.mp4,test2.mp4 `default_output_directory` $output_name"
  
  local result=`read_join_args -o $output_name -i "test1.mp4" -i "test2.mp4" `
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_join_args_with_three_inputs() {
  local message="It should "
  local output_name="TestJoin"
  local expected_result="test1.mp4,test2.mp4,test3.mp4 `default_output_directory` $output_name"
  
  local result=`read_join_args -o $output_name -i "test1.mp4" -i "test2.mp4" -i "test3.mp4"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_join_args_with_no_inputs() {
  local message="It should "
  local output_name="TestJoin"
  local expected_result=`print_help_info`
  
  local result=`read_join_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_join_args_with_output_dir() {
  local message="It should "
  local output_name="TestJoin"
  local output_dir="/TestDir"
  local expected_result="test1.mp4 $output_dir $output_name"
  
  local result=`read_join_args -o $output_name -i test1.mp4 -d $output_dir`
  
  assertEquals "$message" "$expected_result" "$result"
}

suite_addTest test_reading_join_args_with_one_input
suite_addTest test_reading_join_args_with_two_inputs
suite_addTest test_reading_join_args_with_three_inputs
suite_addTest test_reading_join_args_with_no_inputs
suite_addTest test_reading_join_args_with_output_dir

