#!/bin/bash

#----------------
# Name          : read_batch_mode_arguments
# Description   : Reads command arguments for batch mode
# Arguments     : $@
#----------------

source $(dirname $0)/constants/defaults.bash
source $(dirname $0)/messages/help.bash

read_batch_args() {
  while [ "$1" != "" ]; do

    case $1 in
      -i | --input | --batch_file )
        shift
        local input="$1"
        ;;

    esac
    shift
  done

  [[ -z "$input" ]] && show_help `batch_mode_name`

  echo "$input"
}

