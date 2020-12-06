#!/bin/bash

#----------------
# Name          : defaults_tests.bash
# Project       : digitizer
# Description   : Unit tests for reading default constant values
#----------------

source "./_src/utils/constants.bash"
source "./_src/utils/fs.bash"

test_capture_video_mode_name() {
  local message="It should return the default capture-mode name."
  local expected_result="capture_video"

  local result=`capture_video_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_capture_audio_mode_name() {
  local message="It should return the default capture-mode name."
  local expected_result="capture_audio"

  local result=`capture_audio_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_cut_video_mode_name() {
  local message="It should return the default cut-mode name."
  local expected_result="cut_video"

  local result=`cut_video_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_cut_audio_mode_name() {
  local message="It should return the default cut-mode name."
  local expected_result="cut_audio"

  local result=`cut_audio_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_batch_mode_name() {
  local message="It should return the default batch-mode name."
  local expected_result="batch"

  local result=`batch_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_join_mode_name() {
  local message="It should return the default join-mode name."
  local expected_result="join"

  local result=`join_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_watch_mode_name() {
  local message="It should return the default watch-mode name."
  local expected_result="watch"

  local result=`watch_mode_name`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_video_input_dimensions() {
  local message="It should return the default input-video-size value."
  local expected_result="640x480"

  local result=`default_video_input_dimensions`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_video_output_dimensions() {
  local message="It should return the default dimensions."
  local message="It should return the default watch_mode_name value."
  local expected_result="720x540"

  local result=`default_video_output_dimensions`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_video_input_format() {
  local message="It should return the default input-video-size value."
  local expected_result="v4l2"

  local result=`default_video_input_format`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_audio_input_format() {
  local message="It should return the default input-video-size value."
  local expected_result="alsa"

  local result=`default_audio_input_format`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_input_video_format() {
  local message="It should return the default input-video-format value."
  local expected_result="v4l2"

  local result=`default_video_input_format`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_start_time() {
  local message="It should return the default start-time value."
  local expected_result="00:00:00.000"

  local result=`default_start_time`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_video_stop_time() {
  local message="It should return the default stop-time value."
  local expected_result="06:00:00.000"

  local result=`default_video_stop_time`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_audio_stop_time() {
  local message="It should return the default stop-time value."
  local expected_result="01:00:00.000"

  local result=`default_audio_stop_time`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_crf() {
  local message="It should return the default crf value."
  local expected_result="28"

  local result=`default_crf`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_preset() {
  local message="It should return the default preset value."
  local expected_result="slow"

  local result=`default_preset`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_crop() {
  local message="It should return the default crop value."
  local expected_result="in_w-2*20:in_h-2*20"

  local result=`default_crop`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_video_codec() {
  local message="It should return the default video-codec value."
  local expected_result="libx264"

  local result=`default_video_codec`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_tune() {
  local message="It should return the default tune value."
  local expected_result="film"

  local result=`default_tune`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_standard() {
  local message="It should return the default standard."
  local expected_result="ntsc"

  local result=`default_standard`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_format() {
  local message="It should return the default format."
  local expected_result="mpeg"

  local result=`default_format`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_max_threads() {
  local message="It should return the default max-threads value."
  local expected_result="512"

  local result=`default_max_threads`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_max_queue() {
  local message="It should return the default max-queue value."
  local expected_result="400"

  local result=`default_max_queue`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_number_of_audio_channels() {
  local message="It should return the default number of audio channels."
  local expected_result="2"

  local result=`default_number_of_audio_channels`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_audio_output_format() {
  local message="It should return the default audio output format."
  local expected_result="wav"

  local result=`default_audio_output_format`

  assertEquals "${message}" "${expected_result}" "${result}"
}

test_default_audio_sample_rate() {
  local message="It should return the default audio sample rate."
  local expected_result="44100"

  local result=`default_audio_sample_rate`

  assertEquals "${message}" "${expected_result}" "${result}"
}

. ./bin/shunit2

