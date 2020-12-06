#!/bin/bash

#----------------
# Name          : capture_audio_mode_tests.bash
# Description   : Unit test capture-audio-mode funcionality
#----------------

source "./_src/modes/capture_audio_mode.bash"
source "./_src/messages/errors.bash"

test_get_capture_audio_command_with_no_aguments() {
  local message="It should throw a missing-function-args error."
  local expected_result=`error_missing_function_args "get_capture_audio_command"`
  
  local result=`get_capture_audio_command`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_get_capture_audio_command_with_all_aguments() {
  local message="It should return an FFmpeg command with supplied arguments."
  local audio_device="hw:9,9"
  local input_format="raw"
  local output_format="wav"
  local channels="9"
  local sample_rate="99"
  local threads="999"
  local stop_time="99:99:99.999"
  local output_location="/home/me/test_audio.mp3"

  local expected_result="ffmpeg -f $input_format -channels $channels -sample_rate $sample_rate -thread_queue_size $threads -i $audio_device -t $stop_time -f $output_format - | ffmpeg -i - -c copy $output_location -c copy -f $output_format pipe:play | ffplay -i pipe:play -nodisp"
  
  local result=`get_capture_audio_command "$audio_device" "$input_format" "$output_format" "$channels" "$sample_rate" "$threads" "$stop_time" "$output_location"`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

