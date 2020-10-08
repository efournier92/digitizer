#!/bin/bash

#----------------
# Name          : main.bash
# Description   : Executes vhsd to perform vhs-digitization functions based on mode.
# Author        : E Fournier
# Dependencies  : ffmpeg
#----------------

source $(dirname $0)/args/mode_args.bash
source $(dirname $0)/args/help_args.bash
source $(dirname $0)/args/verbose_args.bash
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
source $(dirname $0)/utilities/fs.bash

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

create_config_dir() {
  mkdir -p `config_dir`
}

main() {
  local is_verbose=`read_verbose_args "$@"`
  [[ "$is_verbose" == true ]] && VERBOSE=true
  
  create_config_dir

  local mode=`read_mode_args "$@"`
  read_help_args "$@"
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

