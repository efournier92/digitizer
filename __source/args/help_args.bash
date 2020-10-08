#!/bin/bash

#----------------
# Name          : help_args.bash
# Description   : Reads command arguments requesting help info
#----------------

source $(dirname $0)/messages/logs.bash
source $(dirname $0)/messages/errors.bash
source $(dirname $0)/messages/help.bash

read_help_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  while [ "$1" != "" ]; do
    case $1 in
      -h | --help )
        local should_show_help=true
        ;;

    esac
    shift
  done
 
  if [[ "$should_show_help" == true ]]; then
    print_help_by_mode "$mode"
    exit
  fi
}

