#!/bin/bash

#----------------
# Name          : main.bash
# Description   : Executes vhsd to perform vhs-digitization functions based on mode.
# Author        : E Fournier
# Dependencies  : ffmpeg
#----------------

source $(dirname $0)/__source/args/general_args.bash
source $(dirname $0)/__source/args/batch_args.bash
source $(dirname $0)/__source/args/capture_args.bash
source $(dirname $0)/__source/args/cut_args.bash
source $(dirname $0)/__source/args/join_args.bash
source $(dirname $0)/__source/args/watch_args.bash
source $(dirname $0)/__source/modes/batch_mode.bash
source $(dirname $0)/__source/modes/capture_mode.bash
source $(dirname $0)/__source/modes/cut_mode.bash
source $(dirname $0)/__source/modes/join_mode.bash
source $(dirname $0)/__source/messages/help.bash

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

