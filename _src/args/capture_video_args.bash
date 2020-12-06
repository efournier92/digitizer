#!/bin/bash

#----------------
# Name          : capture_video_args.bash
# Project       : digitizer
# Description   : Interprets command arguments for capture mode
#----------------

source "./_src/utils/constants.bash"
source "./_src/utils/time.bash"
source "./_src/input/device_select.bash"
source "./_src/messages/logs.bash"
source "./_src/messages/errors.bash"

read_capture_video_args() {
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

      -c | --codec )
        shift
        local codec="$1"
        ;;

      -t | --stop_time )
        shift
        local stop_time="$1"
        ;;

      -d | --output_dir )
        shift
        local output_dir="$1"
        ;;

      -o | --output_name )
        shift
        local output_name="$1"
        ;;

      --video_format )
        shift
        local video_format="$1"
        ;;

      --crf )
        shift
        local crf="$1"
        ;;

      --preset )
        shift
        local preset="$1"
        ;;

      --size )
        shift
        local size="$1"
        ;;

      --standard )
        shift
        local standard="$1"
        ;;

      --threads )
        shift
        local threads="$1"
        ;;

      --tune )
        shift
        local tune="$1"
        ;;

    esac
    shift
  done

  [[ -z "$video_device" ]] && local video_device=`get_video_device_selection`
  [[ -z "$audio_device" ]] && local audio_device=`get_audio_device_selection`
  [[ -z "$codec" ]] && local codec=`default_video_codec`
  [[ -z "$crf" ]] && local crf=`default_crf`
  [[ -z "$video_format" ]] && local video_format=`default_video_input_format`
  [[ -z "$audio_format" ]] && local audio_format=`default_audio_input_format`
  [[ -z "$preset" ]] && local preset=`default_capture_preset`
  [[ -z "$size" ]] && local size=`default_video_input_dimensions`
  [[ -z "$standard" ]] && local standard=`default_standard`
  [[ -z "$stop_time" ]] && local stop_time=`default_video_stop_time`
  [[ -z "$threads" ]] && local threads=`default_max_threads`
  [[ -z "$tune" ]] && local tune=`default_tune`
  [[ -z "$output_format" ]] && local output_format=`default_format`
  [[ -z "$output_dir" ]] && local output_dir=`default_output_dir`
  [[ -z "$output_name" ]] && local output_name=`time_now`
  
  local output_location="${output_dir}/${output_name}.mp4"

  echo "$video_device" "$audio_device" "$codec" "$crf" "$video_format" "$audio_format" "$preset" "$size" "$standard" "$stop_time" "$threads" "$tune" "$output_format" "$output_location"
}

