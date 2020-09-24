#!/bin/bash

#----------------
# Name          : video-stream-capture.bash
# Description   : Converts raw video/audio input stream to a video file
# Author        : E Fournier
# Dependencies  : ffmpeg, ffplay
# Arguments     : -v ${input_video_device} -a ${input_audio_device} -t ${output_duration} -s ${output_video_size} -o ${output_file_name}
# Example Usage : bash video-capture.bash -v /dev/video0 -a hw:2,0 -t 04:00:00 -s 640x480 -o output_file
#----------------

## Functions
source ./capture_video
source ./debugging_info
source ./device_selection
source ./get_override_arguments

## Configurtion

main() {
  local configs=`read_command_arguments "$@"`
  
  if [[ mode == "capture" ]]; then

  elif [[ mode == "trim" ]]; then
  elif [[ mode == "convert" ]]; then
  fi
  exec `get_ffmpeg_command `


  print_debugging_info

  run_capture_process "${configs}"
}

get_configs() {
  local arguments="${1}"

  get_override_arguments "${arguments}"
  get_video_device_selection
  get_audio_device_selection
}


### Ensure required arguments are valid

## Capture video from input stream

