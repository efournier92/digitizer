#!/bin/bash

#----------------
# Name          : read_command_arguments
# Description   : Interprets general command arguments
# Arguments     : $@
#----------------

source $(dirname $0)/messages/help.bash

read_general_args() {
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
 
  [[ -z "$mode" ]] && show_help

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

