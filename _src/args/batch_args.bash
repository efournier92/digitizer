#!/bin/bash

#----------------
# Name          : batch_args.bash
# Description   : Reads command arguments for batch mode
#----------------

source ./messages/logs.bash
source ./messages/errors.bash
source ./utilities/fs.bash

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

  [[ -z "$input" ]] && local input=`batch_file_location`

  echo "$input"
}

