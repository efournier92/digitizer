#!/bin/bash

#----------------
# Name          : cut_args_tests
# Description   : Unit test cut-mode functionality
#----------------

source ./help/help.bash
source ./args/cut_args.bash

test_reading_with_no_args() {
  local message="It should "
  local expected_result=`print_help_info`
  
  local result=`read_cut_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_input_short_arg() {
  local message="It should "
  local input_file="TestFile"
  local expected_result="$input_file `default_start_time` `default_stop_time` `default_video_codec` `default_dimensions` `default_tune` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_directory`/`time_now`.mp4"
  
  local result=`read_cut_args -i "$input_file"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_input_long_arg() {
  local message="It should "
  local input_file="TestFile"
  local expected_result="$input_file `default_start_time` `default_stop_time` `default_video_codec` `default_dimensions` `default_tune` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_directory`/`time_now`.mp4"
  
  local result=`read_cut_args --input_file "$input_file"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_start_time_short_arg() {
  local message="It should "
  local input_file="TestFile"
  local start_time="99:99:99.999"
  local expected_result="$input_file $start_time `default_stop_time` `default_video_codec` `default_dimensions` `default_tune` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_directory`/`time_now`.mp4"
  
  local result=`read_cut_args -ss "$start_time"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_with_start_time_long_arg() {
  local message="It should "
  local input_file="TestFile"
  local start_time="99:99:99.999"
  local expected_result="$input_file $start_time `default_stop_time` `default_video_codec` `default_dimensions` `default_tune` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_directory`/`time_now`.mp4"
  
  local result=`read_cut_args --start_time "$start_time"`
  
  assertEquals "$message" "$expected_result" "$result"
}

suite_addTest test_reading_with_no_args
suite_addTest test_reading_with_input_short_arg
suite_addTest test_reading_with_input_long_arg
suite_addTest test_reading_with_start_time_short_arg
suite_addTest test_reading_with_start_time_long_arg

