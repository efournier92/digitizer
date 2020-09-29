#!/bin/bash

#----------------
# Name          : read_command_arguments
# Description   : Interprets general command arguments
# Arguments     : $@
#----------------

source $(dirname $0)/input/selection/select_device.bash
source $(dirname $0)/constants/defaults.bash
source $(dirname $0)/utilities/time.bash
source $(dirname $0)/help/help.bash

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
  
  [[ -z "$mode" ]] && print_help_info

  echo "$mode"
}

