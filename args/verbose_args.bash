#!/bin/bash

#----------------
# Name          : verbose_args
# Description   : 
# Arguments     : $@
#----------------

source $(dirname $0)/messages/help.bash
source $(dirname $0)/messages/logs.bash
source $(dirname $0)/messages/errors.bash

read_general_args() {
  while [ "$1" != "" ]; do
    case $1 in
      -v | --verbose )
        shift
        local is_verbose="true"
        ;;

    esac
    shift
  done
 
  [[ -z "$is_verbose" ]] && local is_verbose="false"
  [[ "$is_verbose" = true ]] && log_arguments "${FUNCNAME[0]} $@"

  echo "$is_verbose"
}

