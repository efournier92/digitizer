#!/bin/bash

source $(dirname $0)/constants/video_defaults.bash

test_return_max_capture_duration() {
  local message="It should return the preconfigured max_capture_duration value"
  local expected_result="06:00:00"

  local result=`get_default_end_time`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_return_video_size() {
  local message="It should return the preconfigured video_size value"
  local expected_result="640x480"

  local result=`get_video_size`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_return_input_video_format() {
  local message="It should return the preconfigured input_video_format value"
  local expected_result="v4l2"

  local result=`get_input_video_format`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_return_input_audio_format() {
  local message="It should return the preconfigured input_audio_format value"
  local expected_result="alsa"

  local result=`get_input_audio_format`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_return_input_video_codec() {
  local message="It should return the preconfigured input_video_codec value"
  local expected_result="libx264"

  local result=`get_output_video_codec`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_return_output_format() {
  local message="It should return the preconfigured output_format value"
  local expected_result="mpeg"
  
  local result=`get_output_format`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_return_output_extension() {
  local message="It should return the preconfigured output_extension value"
  local expected_result="mp4"
  
  local result=`get_output_extension`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_return_output_tuning() {
  local message="It should return the preconfigured output_tuning value"
  local expected_result="zerolatency"
  
  local result=`get_output_tuning`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_return_output_crf() {
  local message="It should return the preconfigured output_crf value"
  local expected_result="16"

  local result=`get_output_crf`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_return_output_max_threads() {
  local message="It should return the preconfigured output_max_threads value"
  local expected_result="512"

  local result=`get_output_max_threads`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_return_output_speed_preset() {
  local message="It should return the preconfigured output_speed_preset value"
  local expected_result="fast"

  local result=`get_output_speed_preset`

  assertEquals "${message}" "${expected_result}" "${result}"
}

suite_addTest test_return_max_capture_duration
suite_addTest test_return_video_size
suite_addTest test_return_input_video_format
suite_addTest test_return_input_audio_format
suite_addTest test_return_input_video_codec
suite_addTest test_return_output_format
suite_addTest test_return_output_extension
suite_addTest test_return_output_tuning
suite_addTest test_return_output_crf
suite_addTest test_return_output_max_threads
suite_addTest test_return_output_speed_preset

