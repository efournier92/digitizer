#!/bin/bash

#----------------
# Name          : 
# Description   : 
# Author        : E Fournier
# Dependencies  : 
# Arguments     : 
# Example Usage : 
#----------------

source ./args/watch_mode.bash

test_read_watch_args_with_no_args() {
  local message="It should return the user-inputed devices"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_video_device $test_audio_device"
  
  local result=`read_watch_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_read_watch_args_with_video_device_short_arg() {
  local message="It should return the user-inputed devices"
  local test_video_device="/dev/video7"
  local test_audio_device="hw:9,9"
  get_video_device_selection() { echo "" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_video_device $test_audio_device"
  
  local result=`read_watch_args -i "$test_video_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_read_watch_args_with_video_device_first_long_arg() {
  local message="It should return the user-inputed devices"
  local test_video_device="/dev/video7"
  local test_audio_device="hw:9,9"
  get_video_device_selection() { echo "" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_video_device $test_audio_device"
  
  local result=`read_watch_args --input "$test_video_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_read_watch_args_with_video_device_second_long_arg() {
  local message="It should return the user-inputed devices"
  local test_video_device="/dev/video7"
  local test_audio_device="hw:9,9"
  get_video_device_selection() { echo "" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_video_device $test_audio_device"
  
  local result=`read_watch_args --video_device "$test_video_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_read_watch_args_with_audio_device_short_arg() {
  local message="It should return the user-inputed devices"
  local test_video_device="/dev/video7"
  local test_audio_device="hw:9,9"
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "" ; }
  local expected_result="$test_video_device $test_audio_device"
  
  local result=`read_watch_args -a "$test_audio_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_read_watch_args_with_audio_device_long_arg() {
  local message="It should return the user-inputed devices"
  local test_video_device="/dev/video7"
  local test_audio_device="hw:9,9"
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "" ; }
  local expected_result="$test_video_device $test_audio_device"
  
  local result=`read_watch_args --audio_device "$test_audio_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

suite_addTest test_read_watch_args_with_no_args
suite_addTest test_read_watch_args_with_video_device_short_arg
suite_addTest test_read_watch_args_with_video_device_first_long_arg
suite_addTest test_read_watch_args_with_video_device_second_long_arg
suite_addTest test_read_watch_args_with_audio_device_short_arg
suite_addTest test_read_watch_args_with_audio_device_long_arg

