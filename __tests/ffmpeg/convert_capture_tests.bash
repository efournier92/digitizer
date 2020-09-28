#!/bin/bash

source $(dirname $0)/ffmpeg/convert_capture.bash
source $(dirname $0)/input/arguments/read_command_arguments.bash

get_video_device_selection() { 
    echo "/dev/video0" 
}
get_audio_device_selection() { 
    echo "hw:2,0" 
}
get_time_right_now() { 
    echo "200909185525" 
}

test_get_convert_capture_command() {
  local message="It should "
  local input=`read_command_arguments`
  local expected_result="ffmpeg -i /dev/video0 -ss 00:00:00 -c:v libx264 -crf 28 -tune film -preset slow -vf 'yadif ,crop=20:20:20:20,scale=720:540' -profile:v baseline -level 3.0 -pix_fmt yuv420p -c:a aac -ac 2 -b:a 128k -t 06:00:00 -max_muxing_queue_size 400 -movflags faststart MyVideo"

  local result=`get_convert_command $(read_command_arguments)`
  
  assertEquals "$message" "$expected_result" "$result"
}

suite_addTest test_get_convert_capture_command

