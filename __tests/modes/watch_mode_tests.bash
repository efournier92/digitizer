#!/bin/bash

#----------------
# Name          : watch_mode_tests.bash
# Description   : Unit test watch-mode funcionality
#----------------

source ./__source/modes/watch_mode.bash
source ./__source/constants/defaults.bash

test_watch_mode_with_no_arguments() {
  local message="It should throw a missing-function-args error."
  local expected_result=`error_missing_function_args "watch_mode" ""`
  
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

test_watch_mode_with_both_arguments() {
  local message="It should execute an ffplay command based on the inputted devices."
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  local expected_result=`get_ffplay_command "$test_video_device" "$test_audio_device"`
  eval() { echo "$expected_result" ; } 
  
  local result=`watch_mode "$test_video_device" "$test_audio_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_get_ffplay_command_with_no_arguments() {
  local message="It should throw a missing-function-args error."
  local expected_result=`error_missing_function_args "get_ffplay_command" ""`
  
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
  local expected_result="ffplay -standard `default_standard` -i $test_video_device -i $test_audio_device"
  
  local result=`get_ffplay_command "$test_video_device" "$test_audio_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_run_ffplay_command_without_arguments() {
  local message="It should throw a missing-function-args error."
  local expected_result=`error_missing_function_args "run_ffplay_command" ""`
  
  local result=`run_ffplay_command`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_run_ffplay_command_with_argument() {
  local message="It should execute the inputted ffplay command."
  local test_ffmpeg_command="ffplay -i test"
  eval() { echo "$test_ffmpeg_command" ; }
  local expected_result="$test_ffmpeg_command"
  
  local result=`run_ffplay_command "$test_ffmpeg_command"`
  
  assertEquals "$message" "$expected_result" "$result"
}

suite_addTest test_watch_mode_with_no_arguments
suite_addTest test_watch_mode_without_audio_device_argument
suite_addTest test_watch_mode_with_both_arguments
suite_addTest test_get_ffplay_command_with_no_arguments
suite_addTest test_get_ffplay_command_without_audio_device
suite_addTest test_get_ffplay_command_with_both_arguments
suite_addTest test_run_ffplay_command_without_arguments
suite_addTest test_run_ffplay_command_with_argument
suite_addTest test_run_ffplay_command_with_argument

