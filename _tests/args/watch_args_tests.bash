#!/bin/bash

#----------------
# Name          : watch_args_tests.bash
# Description   : Unit test reading arguments for watch mode
#----------------

source "./_src/args/watch_args.bash"

test_reading_watch_args_with_no_args() {
  local message="It should the video and audio devices as inputed by the user."
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_video_device $test_audio_device"
  
  local result=`read_watch_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_watch_args_with_video_device_short_arg() {
  local message="Result should include the configured video_device."
  local test_video_device="/dev/video7"
  local test_audio_device="hw:9,9"
  get_video_device_selection() { echo "" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_video_device $test_audio_device"
  
  local result=`read_watch_args -i "$test_video_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_watch_args_with_video_device_first_long_arg() {
  local message="Result should include the configured video_device."
  local test_video_device="/dev/video7"
  local test_audio_device="hw:9,9"
  get_video_device_selection() { echo "" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_video_device $test_audio_device"
  
  local result=`read_watch_args --input "$test_video_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_watch_args_with_video_device_second_long_arg() {
  local message="Result should include the configured video_device."
  local test_video_device="/dev/video7"
  local test_audio_device="hw:9,9"
  get_video_device_selection() { echo "" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_video_device $test_audio_device"
  
  local result=`read_watch_args --video_device "$test_video_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_watch_args_with_audio_device_short_arg() {
  local message="Result should include the configured audio_device."
  local test_video_device="/dev/video7"
  local test_audio_device="hw:9,9"
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "" ; }
  local expected_result="$test_video_device $test_audio_device"
  
  local result=`read_watch_args -a "$test_audio_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_watch_args_with_audio_device_long_arg() {
  local message="Result should include the configured audio_device."
  local test_video_device="/dev/video7"
  local test_audio_device="hw:9,9"
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "" ; }
  local expected_result="$test_video_device $test_audio_device"
  
  local result=`read_watch_args --audio_device "$test_audio_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

