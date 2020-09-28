#!/bin/bash

source $(dirname $0)/FFmpeg/capture_video.bash

test_get_capture_command() {
  local message="It should "
  local input=""
  local expected_result=""
  
  local result=`get_capture_command "$input"`
  
  assertEquals "$message" "$expected_result" "$result"
}

