#!/bin/bash

#----------------
# Name          : watch_args.bash
# Project       : digitizer
# Description   : Reads command arguments for watch mode
#----------------

source "./_src/input/device_select.bash"
source "./_src/messages/logs.bash"
source "./_src/messages/errors.bash"

read_watch_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local i=0
  while [ "$1" != "" ]; do
    case $1 in
      -i | --input | --video_device )
        shift
        local video_device="$1"
        ;;

    esac
    shift
  done

  [[ -z "$video_device" ]] && local video_device=`get_video_device_selection`
  
  echo "$video_device"
}

