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
source $(dirname $0)/args/general_args.bash
source $(dirname $0)/args/batch_args.bash
source $(dirname $0)/args/capture_args.bash
source $(dirname $0)/args/cut_args.bash
source $(dirname $0)/args/join_args.bash
source $(dirname $0)/args/watch_args.bash
source $(dirname $0)/modes/batch_mode.bash
source $(dirname $0)/modes/capture_mode.bash
source $(dirname $0)/modes/cut_mode.bash
source $(dirname $0)/modes/join_mode.bash
source $(dirname $0)/messages/help.bash

run_capture_mode() {
  capture_mode `read_capture_args "$@"`
}

run_cut_mode() {
  cut_mode `read_cut_args "$@"`
}

run_batch_mode() {
  batch_mode `read_batch_args "$@"`
}

run_join_mode() {
  join_mode `read_join_args "$@"`
}

run_watch_mode() {
  watch_mode `read_watch_args "$@"`
}

main() {
  local is_verbose=`read_verbose_args "$@"`
  [[ "$is_verbose" == true ]] && VERBOSE=true

  local mode=`read_general_args "$@"`
  if [[ "$mode" == `capture_mode_name` ]]; then
    run_capture_mode "$@"
  elif [[ "$mode" == `cut_mode_name` ]]; then
    run_cut_mode "$@"
  elif [[ "$mode" == `batch_mode_name` ]]; then
    run_batch_mode "$@"
  elif [[ "$mode" == `join_mode_name` ]]; then
    run_join_mode "$@"
  elif [[ "$mode" == `watch_mode_name` ]]; then
    run_watch_mode "$@"
  else
    `print_help_menu`
  fi
}

main "$@"

