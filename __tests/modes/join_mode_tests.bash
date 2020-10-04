#!/bin/bash

#----------------
# Name          : join_mode_tests.bash
# Description   : Unit test join-mode funcionality
#----------------

source ./__source/modes/join_mode.bash
source ./__source/messages/help.bash
source ./__source/messages/errors.bash

test_get_ffmpeg_command_with_all_args() {
  local message="It should "
  local concat_file_location="./concat_file.txt"
  local output_dir="./TestDir"
  local output_name="TestJoin"
  local expected_result="ffmpeg -f concat -safe 0 -i $concat_file_location -c copy $output_dir/$output_name.mp4"
  
  local result=`get_ffmpeg_command "$concat_file_location" "$output_dir" "$output_name"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_get_ffmpeg_command_without_concat_file_location_arg() {
  local message="It should "
  local expected_result=`error_missing_function_args "get_ffmpeg_command"`
  
  local result=`get_ffmpeg_command "" "$output_dir" "$output_name"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_get_ffmpeg_command_without_output_dir_arg() {
  local message="It should "
  local expected_result=`error_missing_function_args "get_ffmpeg_command"`
  
  local result=`get_ffmpeg_command "$concat_file_location" "" "$output_name"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_get_ffmpeg_command_without_output_name_arg() {
  local message="It should "
  local expected_result=`error_missing_function_args "get_ffmpeg_command"`
  
  local result=`get_ffmpeg_command "$concat_file_location" "$output_dir" ""`

  assertEquals "$message" "$expected_result" "$result"
}

suite_addTest test_get_ffmpeg_command_with_all_args
suite_addTest test_get_ffmpeg_command_without_concat_file_location_arg
suite_addTest test_get_ffmpeg_command_without_output_dir_arg
suite_addTest test_get_ffmpeg_command_without_output_name_arg

