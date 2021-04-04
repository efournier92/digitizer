#!/bin/bash

#----------------
# Name          : capture_video_mode_tests.bash
# Project       : digitizer
# Description   : Unit test capture-video-mode funcionality
#----------------

source "./_src/modes/capture_video_mode.bash"
source "./_src/messages/errors.bash"

test_get_capture_video_command_with_no_aguments() {
  local message="It should throw a missing-function-args error."
  local expected_result=`error_missing_function_args "get_capture_video_command"`
  
  local result=`get_capture_video_command`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_get_capture_video_command_with_all_aguments() {
  local message="It should return an FFmpeg command with supplied arguments."
  local video_device="/dev/video0"
  local audio_device="hw:9,9"
  local codec="mpeg"
  local crf="99"
  local video_format="mp4"
  local audio_format="mp3"
  local preset="veryslow"
  local size="999:999"
  local standard="ntsc"
  local stop_time="99:99:99.999"
  local threads="999"
  local tune="film"
  local num_audio_channels="8"
  local output_format="mp4"
  local output_location="/home/me/test_video.mp4"
  local expected_result="ffmpeg -standard $standard -f $video_format -video_size $size -thread_queue_size $threads -i $video_device -f $audio_format -thread_queue_size $threads -i $audio_device -c:v $codec -tune $tune -preset $preset -crf $crf -ac "$num_audio_channels" -t $stop_time -f $output_format - | ffmpeg -i - -c copy $output_location -c copy -f s32le pipe:play | ffplay -i pipe:play -nodisp"
  
  local result=`get_capture_video_command "$video_device" "$audio_device" "$codec" "$crf" "$video_format" "$audio_format" "$preset" "$size" "$standard" "$stop_time" "$threads" "$tune" "$num_audio_channels" "$output_format" "$output_location"`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

