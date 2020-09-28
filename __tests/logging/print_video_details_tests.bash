#!/bin/bash

source $(dirname $0)/logging/print_video_details.bash

test_message() {
  local message="It should return a list of available arguments"
  local input_video_device="/dev/video0"
  local expected_result="Video Input Device      : ${input_video_device}\n"
  local result=`print_debugging_info "${input_video_device}" bar`

  assertContains "${message}" "${result}" "${expected_result}"
}

# TODO: Test rest of the messages

suite_addTest test_message

