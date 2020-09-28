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
source $(dirname $0)/input/arguments/read_command_arguments.bash
source $(dirname $0)/input/arguments/read_convert_mode_arguments.bash
source $(dirname $0)/input/arguments/read_batch_mode_arguments.bash
source $(dirname $0)/ffmpeg/capture_video.bash
source $(dirname $0)/ffmpeg/convert_capture.bash
source $(dirname $0)/ffmpeg/batch_convert.bash
source $(dirname $0)/cut/cut_segments.bash

## Configurtion

main() {
  local configs=`read_command_arguments "$@"`
  local configsArr=($configs)
  local mode="${configsArr[0]}"
  local input_file="${configsArr[1]}"

  if [[ "$mode" == "capture" ]]; then
    eval `get_convert_command `read_convert_mode_arguments` "$@"`
  elif [[ "$mode" == "convert" ]]; then
    eval `get_convert_command $(read_convert_mode_arguments "$@")`
  elif [[ "$mode" == "batch" ]]; then
    batch_convert $(read_batch_mode_arguments "$@")
  elif [[ "$mode" == "cut" ]]; then
    cut_segments "$input_file"
  elif [[ "$mode" == "join" ]]; then
    eval `join_segments $(read_join_mode_arguments "$@")`
  else
    echo "USAGE"
  fi
}

main "$@"

