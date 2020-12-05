#!/bin/bash

#----------------
# Name          : defaults_tests.bash
# Description   : Unit tests for reading default constant values
#----------------

source "./_src/utils/constants.bash"
source "./_src/utils/fs.bash"

test_capture_mode_name() {
  local message="Result should contain the default name of capture_mode."
  local expected_result="capture"

  local result=`capture_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_cut_mode_name() {
  local message="Result should contain the default name of cut_mode."
  local expected_result="cut"

  local result=`cut_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_batch_mode_name() {
  local message="Result should contain the default name of batch_mode."
  local expected_result="batch"

  local result=`batch_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_join_mode_name() {
  local message="Result should contain the default name of join_mode."
  local expected_result="join"

  local result=`join_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_watch_mode_name() {
  local message="Result should contain the default name of watch_mode."
  local expected_result="watch"

  local result=`watch_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_timestamp_regex() {
  local message="Result should contain the default value for timestamp_regex."
  local expected_result="[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}"

  local result=`timestamp_regex`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_output_dir() {
  local message="Result should contain the default value for output_dir."
  local expected_result="$(pwd)"

  local result=`default_output_dir`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_output_file() {
  local message="Result should contain the default value for output_file."
  local expected_result="`default_output_dir`/`time_now`.mp4"

  local result=`default_output_file_location`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_batch_file_name() {
  local message="Result should contain the default name of batch_file."
  local expected_result="digitizer_batch.txt"

  local result=`batch_file_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_concat_file_name() {
  local message="Result should contain the default name of concat_file."
  local expected_result="_temp_concat.txt"

  local result=`concat_file_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_input_video_size() {
  local message="Result should contain the default value for input_video_size."
  local expected_result="640x480"

  local result=`default_input_video_size`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_input_video_format() {
  local message="Result should contain the default value for input_video_format."
  local expected_result="v4l2"

  local result=`default_input_video_format`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_input_audio_format() {
  local message="Result should contain the default value for input_audio_format."
  local expected_result="alsa"

  local result=`default_input_audio_format`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_dimensions() {
  local message="Result should contain the default dimensions."
  local message="It should return the default watch_mode_name value."
  local expected_result="720x540"

  local result=`default_dimensions`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_start_time() {
  local message="Result should contain the default value for start_time."
  local expected_result="00:00:00.000"

  local result=`default_start_time`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_stop_time() {
  local message="Result should contain the default value for stop_time."
  local expected_result="06:00:00.000"

  local result=`default_stop_time`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_crf() {
  local message="Result should contain the default crf."
  local expected_result="28"

  local result=`default_crf`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_preset() {
  local message="Result should contain the default preset."
  local expected_result="slow"

  local result=`default_preset`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_crop() {
  local message="Result should contain the default value for crop."
  local expected_result="in_w-2*20:in_h-2*20"

  local result=`default_crop`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_video_codec() {
  local message="Result should contain the default video_codec."
  local expected_result="libx264"

  local result=`default_video_codec`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_tune() {
  local message="Result should contain the default tune."
  local expected_result="film"

  local result=`default_tune`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_standard() {
  local message="Result should contain the default standard."
  local expected_result="ntsc"

  local result=`default_standard`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_format() {
  local message="Result should contain the default format."
  local expected_result="mpeg"

  local result=`default_format`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_extension() {
  local message="Result should contain the default extension."
  local expected_result="mp4"

  local result=`default_extension`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_max_threads() {
  local message="Result should contain the default max_threads."
  local expected_result="512"

  local result=`default_max_threads`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_max_queue() {
  local message="Result should contain the default max_queue_size."
  local expected_result="400"

  local result=`default_max_queue`

  assertEquals "${message}" "${expected_result}" "${result}"
}

. ./bin/shunit2

