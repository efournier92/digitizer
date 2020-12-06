#!/bin/bash

#----------------
# Name          : verbose_args.bash
# Project       : digitizer
# Description   : Interpretss command arguments pertaining to verbosity
#----------------

source "./_src/messages/help.bash"
source "./_src/messages/logs.bash"
source "./_src/messages/errors.bash"

read_verbose_args() {
  [[ "$is_verbose" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  while [ "$1" != "" ]; do
    case $1 in

      -v | --verbose )
        local is_verbose="true"
        ;;

    esac
    shift
  done
 
  [[ -z "$is_verbose" ]] && local is_verbose="false"

  echo "$is_verbose"
}

