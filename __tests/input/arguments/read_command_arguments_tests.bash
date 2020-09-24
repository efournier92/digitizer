#!/bin/bash

source ../input/arguments/read_command_arguments.bash

# Mocks
get_video_device_selection() { 
    echo "/dev/video0" 
}
get_audio_device_selection() { 
    echo "hw:2,0" 
}
get_time_right_now() { 
    echo "200909185525" 
}

test_result_with_no_arguments() {
  local message="It should return the default list of configuration values"
  local expected_result="/dev/video0 hw:2,0 06:00:00 640x480 200909185525"

  local result=`read_command_arguments`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_result_with_video_input_argument() {
  local message="It should return the configured video_input"
  local expected_result="/dev/video9 hw:2,0 06:00:00 640x480 200909185525"

  local result=`read_command_arguments -v /dev/video9`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_result_with_audio_input_argument() {
  local message="It should return the configured audio_input"
  local expected_result="/dev/video0 hw:9,9 06:00:00 640x480 200909185525"

  local result=`read_command_arguments -a hw:9,9`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_result_with_output_duration_argument() {
  local message="It should return the configured output_duration"
  local expected_result="/dev/video0 hw:2,0 99:99:99 640x480 200909185525"

  local result=`read_command_arguments -d 99:99:99`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_result_with_output_name_argument() {
  local message="It should return the configured output_name"
  local expected_result="/dev/video0 hw:2,0 06:00:00 640x480 MyVideo"

  local result=`read_command_arguments -o MyVideo`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_result_with_help_argument() {
  local message="It should return a list of available arguments"
  local expected_result="Usage"

  local result=`read_command_arguments -h`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_result_with_all_short_form_configuration_arguments() {
  local message="It should return all values as configured"
  local expected_result="/dev/video9 hw:9,9 99:99:99 999x999 MyVideo"

  local result=`read_command_arguments -v /dev/video9 -a hw:9,9 -d 99:99:99 -s 999x999 -o MyVideo`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_result_with_all_long_form_configuration_arguments() {
  local message="It should return all values as configured"
  local expected_result="/dev/video9 hw:9,9 99:99:99 999x999 MyVideo"

  local result=`read_command_arguments --video_device /dev/video9 --audio_device hw:9,9 --output_duration 99:99:99 --output_size 999x999 --output_name MyVideo`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_result_with_all_short_form_configuration_arguments_plus_help() {
  local message="It should return a list of available arguments"
  local expected_result="Usage"

  local result=`read_command_arguments -v /dev/video9 -a hw:9,9 -t 99:99:99 -s 999x999 -o MyVideo -h`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_result_with_all_long_form_configuration_arguments_plus_help() {
  local message="It should return a list of available arguments"
  local expected_result="Usage"

  local result=`read_command_arguments --video_device /dev/video9 --audio_device hw:9,9 --output_duration 99:99:99 --output_size 999x999 --output_name MyVideo --help`

  assertEquals "${message}" "${expected_result}" "${result}"
}

suite_addTest test_result_with_no_arguments
suite_addTest test_result_with_video_input_argument
suite_addTest test_result_with_audio_input_argument
suite_addTest test_result_with_output_duration_argument
suite_addTest test_result_with_output_name_argument
suite_addTest test_result_with_help_argument
suite_addTest test_result_with_all_short_form_configuration_arguments
suite_addTest test_result_with_all_long_form_configuration_arguments
test_result_with_all_short_form_configuration_arguments_plus_help
test_result_with_all_long_form_configuration_arguments_plus_help
