#!/bin/bash

#----------------
# Name          : read_command_arguments
# Description   : Interprets general command arguments
# Arguments     : $@
#----------------

source $(dirname $0)/messages/help.bash
source $(dirname $0)/messages/logs.bash
source $(dirname $0)/messages/errors.bash
source $(dirname $0)/utilities/modes.bash

read_general_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  while [ "$1" != "" ]; do
    case $1 in
      -m | --mode )
        shift
        local mode="$1"
        ;;

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

  [[ -z "$mode" ]] && error_missing_required_arg "mode" "${FUNCNAME[0]}"
  [[ `is_mode_known "$mode"` == false ]] && error_mode_not_found "$mode" "${FUNCNAME[0]}"

  echo "$mode"
}

