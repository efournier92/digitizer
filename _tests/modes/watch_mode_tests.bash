#!/bin/bash

#----------------
# Name          : watch_mode_tests.bash
# Description   : Unit test watch-mode funcionality
#----------------

source "./_src/modes/watch_mode.bash"
source "./_src/utils/constants.bash"

test_watch_mode_with_no_arguments() {
  local message="It should throw a missing-function-args error."
  local expected_result=`error_missing_function_args "watch_mode"`
  
  local result=`watch_mode`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_watch_mode_without_audio_device_argument() {
  local message="It should throw a missing-function-args error."
  local test_video_device="/dev/video9"
  local expected_result=`error_missing_function_args "watch_mode" "$test_video_device"`
  
  local result=`watch_mode "$test_video_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_get_ffplay_command_with_no_arguments() {
  local message="It should throw a missing-function-args error."
  local expected_result=`error_missing_function_args "get_ffplay_command"`
  
  local result=`get_ffplay_command`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_get_ffplay_command_without_audio_device() {
  local message="It should throw a missing-function-args error."
  local test_video_device="/dev/video9"
  local expected_result=`error_missing_function_args "get_ffplay_command" "$test_video_device"`
  
  local result=`get_ffplay_command $test_video_device`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_get_ffplay_command_with_both_arguments() {
  local message="It should return a properly-formatted ffplay command."
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  local expected_result="ffplay -standard `default_standard` -i $test_video_device"
  
  local result=`get_ffplay_command "$test_video_device" "$test_audio_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_run_ffplay_command_without_arguments() {
  local message="It should throw a missing-function-args error."
  local expected_result=`error_missing_function_args "run_ffplay_command"`
  
  local result=`run_ffplay_command`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

