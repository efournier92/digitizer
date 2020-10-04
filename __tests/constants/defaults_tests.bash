#!/bin/bash

source $(dirname $0)/constants/defaults.bash

test_capture_mode_name() {
  local message="It should return the default capture_mode_name value"
  local expected_result="capture"

  local result=`capture_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_cut_mode_name() {
  local message="It should return the default cut_mode_name value"
  local expected_result="cut"

  local result=`cut_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_batch_mode_name() {
  local message="It should return the default batch_mode_name value"
  local expected_result="batch"

  local result=`batch_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_join_mode_name() {
  local message="It should return the default join_mode_name value"
  local expected_result="join"

  local result=`join_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_watch_mode_name() {
  local message="It should return the default watch_mode_name value"
  local expected_result="watch"

  local result=`watch_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_timestamp_regex() {
  local message="It should return the default watch_mode_name value"
  local expected_result="[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}"

  local result=`timestamp_regex`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_output_dir() {
  local message="It should return the default watch_mode_name value"
  local expected_result="./_vhsd_out"

  local result=`default_output_dir`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_output_file() {
  local message="It should return the default watch_mode_name value"
  local expected_result="`default_output_dir`/`time_now`.mp4"

  local result=`default_output_file`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_batch_file_name() {
  local message="It should return the default watch_mode_name value"
  local expected_result="vhsd_batch_file.txt"

  local result=`default_batch_file_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_concat_file_name() {
  local message="It should return the default watch_mode_name value"
  local expected_result="vhsd_concat_file.txt"

  local result=`default_concat_file_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_log_file_name() {
  local message="It should return the default watch_mode_name value"
  local expected_result="./vhsd_log.txt"

  local result=`log_file_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_input_video_size() {
  local message="It should return the default watch_mode_name value"
  local expected_result="640x480"

  local result=`default_input_video_size`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_input_video_format() {
  local message="It should return the default watch_mode_name value"
  local expected_result="v4l2"

  local result=`default_input_video_format`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_input_audio_format() {
  local message="It should return the default watch_mode_name value"
  local expected_result="alsa"

  local result=`default_input_audio_format`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_dimensions() {
  local message="It should return the default watch_mode_name value"
  local expected_result="720x540"

  local result=`default_dimensions`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_start_time() {
  local message="It should return the default watch_mode_name value"
  local expected_result="00:00:00.000"

  local result=`default_start_time`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_stop_time() {
  local message="It should return the default watch_mode_name value"
  local expected_result="06:00:00.000"

  local result=`default_stop_time`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_crf() {
  local message="It should return the default watch_mode_name value"
  local expected_result="28"

  local result=`default_crf`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_preset() {
  local message="It should return the default watch_mode_name value"
  local expected_result="slow"

  local result=`default_preset`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_crop() {
  local message="It should return the default watch_mode_name value"
  local expected_result="in_w-2*20:in_h-2*20"

  local result=`default_crop`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_video_codec() {
  local message="It should return the default watch_mode_name value"
  local expected_result="libx264"

  local result=`default_video_codec`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_tune() {
  local message="It should return the default watch_mode_name value"
  local expected_result="film"

  local result=`default_tune`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_standard() {
  local message="It should return the default watch_mode_name value"
  local expected_result="ntsc"

  local result=`default_standard`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_format() {
  local message="It should return the default watch_mode_name value"
  local expected_result="mpeg"

  local result=`default_format`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_extension() {
  local message="It should return the default watch_mode_name value"
  local expected_result="mp4"

  local result=`default_extension`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_max_threads() {
  local message="It should return the default watch_mode_name value"
  local expected_result="512"

  local result=`default_max_threads`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_max_queue() {
  local message="It should return the default watch_mode_name value"
  local expected_result="400"

  local result=`default_max_queue`

  assertEquals "${message}" "${expected_result}" "${result}"
}

suite_addTest test_capture_mode_name
suite_addTest test_cut_mode_name
suite_addTest test_batch_mode_name
suite_addTest test_join_mode_name
suite_addTest test_watch_mode_name
suite_addTest test_timestamp_regex
suite_addTest test_default_output_dir
suite_addTest test_default_output_file
suite_addTest test_default_batch_file_name
suite_addTest test_default_concat_file_name
suite_addTest test_default_log_file_name
suite_addTest test_default_input_video_size
suite_addTest test_default_input_video_format
suite_addTest test_default_input_audio_format
suite_addTest test_default_dimensions
suite_addTest test_default_start_time
suite_addTest test_default_stop_time
suite_addTest test_default_crf
suite_addTest test_default_preset
suite_addTest test_default_crop
suite_addTest test_default_video_codec
suite_addTest test_default_tune
suite_addTest test_default_standard
suite_addTest test_default_format
suite_addTest test_default_extension
suite_addTest test_default_max_threads
suite_addTest test_default_max_queue

