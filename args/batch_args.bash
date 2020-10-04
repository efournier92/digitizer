#!/bin/bash

#----------------
# Name          : read_batch_mode_arguments
# Description   : Reads command arguments for batch mode
# Arguments     : $@
#----------------

source $(dirname $0)/messages/logs.bash
source $(dirname $0)/messages/errors.bash

read_batch_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  while [ "$1" != "" ]; do

    case $1 in
      -i | --input | --batch_file )
        shift
        local input="$1"
        ;;

    esac
    shift
  done

  [[ -z "$input" ]] && error_missing_required_arg "input" "${FUNCNAME[0]}"

  echo "$input"
}

