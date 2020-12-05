#!/bin/bash

#----------------
# Name          : batch_args.bash
# Description   : Reads command arguments for batch mode
#----------------

source "./_src/messages/logs.bash"
source "./_src/messages/errors.bash"
source "./_src/utils/fs.bash"

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

