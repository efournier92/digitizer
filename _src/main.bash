#!/bin/bash

#----------------
# Name          : main.bash
# Project       : digitizer
# Description   : Executes digitizer to perform vhs-digitization functions based on mode.
# Author        : E Fournier
# Dependencies  : ffmpeg
#----------------

source "./_src/args/mode_args.bash"
source "./_src/args/help_args.bash"
source "./_src/args/verbose_args.bash"
source "./_src/args/batch_args.bash"
source "./_src/args/capture_args.bash"
source "./_src/args/cut_video_args.bash"
source "./_src/args/cut_audio_args.bash"
source "./_src/args/join_args.bash"
source "./_src/args/watch_args.bash"
source "./_src/modes/capture_video_mode.bash"
source "./_src/modes/capture_audio_mode.bash"
source "./_src/modes/cut_video_mode.bash"
source "./_src/modes/cut_audio_mode.bash"
source "./_src/modes/batch_mode.bash"
source "./_src/modes/join_mode.bash"
source "./_src/modes/watch_mode.bash"
source "./_src/modes/audio_mode.bash"
source "./_src/messages/help.bash"
source "./_src/utils/fs.bash"

run_capture_video_mode() {
  capture_video_mode `read_capture_video_args "$@"`
}

run_capture_audio_mode() {
  capture_audio_mode `read_capture_audio_args "$@"`
}

run_cut_video_mode() {
  cut_video_mode `read_cut_video_args "$@"`
}

run_cut_audio_mode() {
  cut_audio_mode `read_video_cut_args "$@"`
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

create_config_dir() {
  mkdir -p `config_dir`
}

main() {
  local is_verbose=`read_verbose_args "$@"`
  [[ "$is_verbose" == true ]] && VERBOSE=true
  
  create_config_dir

  local mode=`read_mode_args "$@"`
  read_help_args "$@"
  if [[ "$mode" == `capture_video_mode_name` ]]; then
    run_capture_video_mode "$@"
  elif [[ "$mode" == `capture_audio_mode_name` ]]; then
    run_capture_audio_mode "$@"
  elif [[ "$mode" == `cut_video_mode_name` ]]; then
    run_cut_video_mode "$@"
  elif [[ "$mode" == `cut_audio_mode_name` ]]; then
    run_cut_audio_mode "$@"
  elif [[ "$mode" == `batch_mode_name` ]]; then
    run_batch_mode "$@"
  elif [[ "$mode" == `join_mode_name` ]]; then
    run_join_mode "$@"
  elif [[ "$mode" == `watch_mode_name` ]]; then
    run_watch_mode "$@"
  elif [[ "$mode" == `audio_mode_name` ]]; then
    run_audio_mode "$@"
  else
    print_help_by_mode
  fi
}

main "$@"

