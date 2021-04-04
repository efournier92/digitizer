#!/bin/bash

#----------------
# Name          : cut_mode_tests.bash
# Project       : digitizer
# Description   : Unit test cut-mode funcionality
#----------------

source "./_src/modes/cut_video_mode.bash"
source "./_src/messages/errors.bash"

test_get_ffmpeg_cut_video_command() {
  local message="It should return an FFmpeg command with the configured values."
  local input_file="/home/me/test_video.mp4"
  local start_time="11:11:11.111"
  local duration="99:99:99.999"
  local codec="mpeg"
  local dimensions="999:999"
  local tune="film"
  local num_audio_channels="8"
  local preset="veryslow"
  local crop="99:99:99:99"
  local queue_size="9"
  local crf="99"
  local output_dir="/home/me/out"
  local output_file_name="out_video"

  local expected_result="ffmpeg -i $(pwd)/$input_file -ss $start_time -c:v $codec -crf $crf -tune $tune -preset $preset -vf yadif=0:0:0,crop=$crop,scale=$dimensions -profile:v baseline -level 3.0 -pix_fmt yuv420p -c:a aac -ac $num_audio_channels -b:a 128k -max_muxing_queue_size $queue_size -t $duration -movflags faststart $output_dir/$output_file_name.mp4"
  
  local result=`get_ffmpeg_cut_video_command "$input_file" "$duration" "$codec" "$dimensions" "$tune" "$num_audio_channels" "$preset" "$crop" "$queue_size" "$crf" "$output_dir" "$output_file_name"`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

