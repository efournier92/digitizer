#!/bin/bash

#----------------
# Name          : join_mode_tests.bash
# Project       : digitizer
# Description   : Unit test join-mode funcionality
#----------------

source "./_src/modes/join_mode.bash"
#source "./_tests/_data/test_constants.bash"
source "./_src/utils/fs.bash"

test_join_mode_with_no_arguments() {
  local message="It should throw a missing-function-args error."
  local expected_result=`error_missing_function_args "join_mode"`
  
  local result=`join_mode`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_join_mode_without_output_dir() {
  local message="It should throw a missing-function-args error."
  local concat_file_location="`config_dir`/concat_file.txt"
  local expected_result=`error_missing_function_args "join_mode" "$concat_file_location"`
  
  local result=`join_mode "$concat_file_location"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_join_mode_without_output_name() {
  local message="It should throw a missing-function-args error."
  local concat_file_location="`config_dir`/concat_file.txt"
  local test_output_dir="TestDir"
  local expected_result=`error_missing_function_args "join_mode" "$concat_file_location" "$test_output_dir"`
  
  local result=`join_mode "$concat_file_location" "$test_output_dir"`
  
  assertEquals "$message" "$expected_result" "$result"
}


test_get_ffmpeg_command_with_all_args() {
  local message="It should return an FFmpeg command with the configured values."
  local concat_file_location="`config_dir`/concat_file.txt"
  local output_dir="./TestDir"
  local output_name="TestJoin"
  local expected_result="ffmpeg -f concat -safe 0 -i $concat_file_location -c copy $output_dir/$output_name.mp4"
  
  local result=`get_ffmpeg_join_command "$concat_file_location" "$output_dir" "$output_name"`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

