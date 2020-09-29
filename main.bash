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
source $(dirname $0)/input/args/general_args.bash
source $(dirname $0)/input/args/batch_args.bash
source $(dirname $0)/input/args/capture_args.bash
source $(dirname $0)/input/args/cut_args.bash
source $(dirname $0)/input/args/join_args.bash
source $(dirname $0)/modes/batch_mode.bash
source $(dirname $0)/modes/capture_mode.bash
source $(dirname $0)/modes/convert_mode.bash
source $(dirname $0)/modes/cut_mode.bash
source $(dirname $0)/modes/join_mode.bash
source $(dirname $0)/utilities/print_help_info.bash

run_capture_mode() {
  local configs=`read_capture_arguments "$@"`
  
  capture_mode "$configs"
}

run_cut_mode() {
  local configs=`read_cut_arguments "$@"`

  cut_mode "$configs"
}

run_batch_mode() {
  local configs=`read_batch_arguments "$@"`
  
  batch_mode "$configs"
}

run_join_mode() {
  local configs=`read_join_arguments "$@"`
  
  join_mode "$configs"
}

main() {
  local mode=`read_general_command_arguments "$@"`

  if [[ "$mode" == "capture" ]]; then
    run_capture_mode "$@"
  elif [[ "$mode" == "cut" ]]; then
    run_cut_mode "$@"
  elif [[ "$mode" == "batch" ]]; then
    run_batch_mode "$@"
  elif [[ "$mode" == "join" ]]; then
    run_join_mode "$@"
  else
    `print_help_info`
  fi
}

main "$@"

