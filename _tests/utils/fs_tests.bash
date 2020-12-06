#!/bin/bash

#----------------
# Name          : fs_tests.bash
# Description   : Unit tests for reading default constant values
#----------------

source "./_src/utils/fs.bash"

test_output_dir() {
  local message="It should return the default output directory. "
  local expected_result="$(pwd)"

  local result=`default_output_dir`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_video_file_name() {
  local message="It should return the default video file name."
  local expected_result="`time_now`.mp4"

  local result=`default_video_file_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_video_file_location() {
  local message="It should return the default video file location."
  local expected_result="`default_output_dir`/`time_now`.mp4"

  local result=`default_video_file_location`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_audio_file_name() {
  local message="It should return the default audio file name."
  local expected_result="`time_now`.wav"

  local result=`default_audio_file_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_audio_file_location() {
  local message="It should return the default audio file location."
  local expected_result="`default_output_dir`/`time_now`.wav"

  local result=`default_audio_file_location`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_config_dir() {
  local message="It should return the default config directory."
  local expected_result="$HOME/.digitizer"

  local result=`config_dir`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_concat_file_name() {
  local message="It should return the default concat file name."
  local expected_result="_temp_concat.txt"

  local result=`concat_file_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_concat_file_location() {
  local message="It should return the default concat file location."
  local expected_result="`config_dir`/`concat_file_name`"

  local result=`concat_file_location`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_batch_file_name() {
  local message="It should return the default batch file name."
  local expected_result="digitizer_batch.txt"

  local result=`batch_file_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_batch_file_location() {
  local message="It should return the default batch file location."
  local expected_result="`config_dir`/`batch_file_name`"

  local result=`batch_file_location`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_nohup_file_name() {
  local message="It should return the default nohup file name."
  local expected_result="_nohup.out"

  local result=`nohup_file_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_nohup_file_location() {
  local message="It should return the default nohup file location."
  local expected_result="`config_dir`/`nohup_file_name`"

  local result=`nohup_file_location`

  assertEquals "${message}" "${expected_result}" "${result}"
}

. ./bin/shunit2

