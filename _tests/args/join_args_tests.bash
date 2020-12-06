#!/bin/bash

#----------------
# Name          : join_args_tests.bash
# Description   : Unit test reading arguments for join mode
#----------------

source "./_src/args/join_args.bash"
source "./_src/utils/constants.bash"
source "./_src/utils/fs.bash"
source "./_src/messages/help.bash"
source "./_src/messages/errors.bash"

test_reading_join_args_with_no_args() {
  local message="Result should contain all default arguments."
  local expected_result=`error_missing_required_arg "input" "read_join_args"`
  
  local result=`read_join_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_join_args_without_output_name_arg() {
  local message="Result should include configured value for output_name."
  local input_file_1="test1.mp4"
  local expected_result=`error_missing_required_arg "output_name" "read_join_args"`
  
  local result=`read_join_args -i "$input_file_1"`
  
  assertEquals "$message" "$expected_result" "$result"
}


test_reading_join_args_with_one_input() {
  local message="Result should include configured value for input."
  local output_name="TestJoin"
  local input_file_1="test1.mp4"
  local expected_result="$input_file_1 `default_output_dir` $output_name"
  
  local result=`read_join_args -o $output_name -i "$input_file_1"`
  
  assertEquals "$message" "$expected_result" "$result"
}


test_reading_join_args_with_two_inputs() {
  local message="Result should include configured value for inputs."
  local message="It should "
  local output_name="TestJoin"
  local input_file_1="test1.mp4"
  local input_file_2="test2.mp4"
  local expected_result="$input_file_1,$input_file_2 `default_output_dir` $output_name"
  
  local result=`read_join_args -o $output_name -i "$input_file_1" -i "$input_file_2"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_join_args_with_three_inputs() {
  local message="Result should include configured value for all 3 inputs."
  local output_name="TestJoin"
  local input_file_1="test1.mp4"
  local input_file_2="test2.mp4"
  local input_file_3="test3.mp4"
  local expected_result="$input_file_1,$input_file_2,$input_file_3 `default_output_dir` $output_name"
  
  local result=`read_join_args -o $output_name -i "$input_file_1" -i "$input_file_2" -i "$input_file_3"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_join_args_with_output_dir() {
  local message="Result should include configured value for output_dir."
  local output_name="TestJoin"
  local output_dir="/TestDir"
  local input_file_1="test1.mp4"
  local expected_result="$input_file_1 $output_dir $output_name"
  
  local result=`read_join_args -o "$output_name" -i "$input_file_1" -d "$output_dir"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_trim_leading_comma() {
  local message="It should trim the leading comma from the input string."
  local output_name="TestJoin"
  local input_file_1="test1.mp4"
  local input_file_2="test2.mp4"
  local input_file_3="test3.mp4"
  local files_to_join="$input_file_1,$input_file_2,$input_file_3"
  local files_to_join_with_comma=",$files_to_join"
  local expected_result="$files_to_join"
  
  local result=`trim_leading_comma $files_to_join_with_comma`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

