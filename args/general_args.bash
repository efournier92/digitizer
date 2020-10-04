#!/bin/bash

#----------------
# Name          : read_command_arguments
# Description   : Interprets general command arguments
# Arguments     : $@
#----------------

source $(dirname $0)/messages/help.bash
source $(dirname $0)/messages/logs.bash
source $(dirname $0)/messages/errors.bash

read_general_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  while [ "$1" != "" ]; do
    case $1 in
      -m | --mode )
        shift
        local mode="$1"
        ;;

      -h | --help )
        print_help_info
        exit
        ;;

    esac
    shift
  done
 
  [[ -z "$mode" ]] && error_missing_required_arg "mode" "${FUNCNAME[0]}"

  [[   "$mode" != `capture_mode_name` \
    && "$mode" != `cut_mode_name` \
    && "$mode" != `cut_mode_name` \
    && "$mode" != `batch_mode_name` \
    && "$mode" != `join_mode_name` \
  ]] && error_mode_not_found "$mode" "${FUNCNAME[0]}"

  if [[ ! -z "$help" ]]; then
    if [[ "$mode" == `capture_mode_name` ]]; then
      show_help `capture_mode_name`
    elif [[ "$mode" == `cut_mode_name` ]]; then
      show_help `cut_mode_name`
    elif [[ "$mode" == `batch_mode_name` ]]; then
      show_help `batch_mode_name`
    elif [[ "$mode" == `join_mode_name` ]]; then
      show_help `join_mode_name`
    fi
  fi

  echo "$mode"
}

