#!/bin/bash

#----------------
# Name          : watch_args.bash
# Description   : Reads command arguments for watch mode
# Arguments     : $@
#----------------

source $(dirname $0)/__source/input/selection/select_device.bash
source $(dirname $0)/__source/messages/logs.bash
source $(dirname $0)/__source/messages/errors.bash

read_watch_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local i=0
  while [ "$1" != "" ]; do
    case $1 in
      -i | --input | --video_device )
        shift
        local video_device="$1"
        ;;

      -a | --audio_device )
        shift
        local audio_device="$1"
        ;;

    esac
    shift
  done

  [[ -z "$video_device" ]] && local video_device=`get_video_device_selection`
  [[ -z "$audio_device" ]] && local audio_device=`get_audio_device_selection`
  
  echo "$video_device" "$audio_device"
}

