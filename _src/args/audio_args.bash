#!/bin/bash

#----------------
# Name          : audio_args.bash
# Description   : Interprets command arguments for capture mode
#----------------

source ./constants/defaults.bash
source ./utilities/time.bash
source ./input/selection/select_device.bash
source ./messages/logs.bash
source ./messages/errors.bash

read_audio_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local i=0
  while [ "$1" != "" ]; do
    case $1 in
      -i | -a | --audio_device )
        shift
        local audio_device="$1"
        ;;

      -fi | --input_format )
        shift
        local format="$1"
        ;;

      -fo | --output_format )
        shift
        local format="$1"
        ;;

      -t | --stop_time )
        shift
        local stop_time="$1"
        ;;

      -c | --channels )
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

      --sample_rate )
        shift
        local sample_rate="$1"
        ;;

      --max_threads )
        shift
        local max_threads="$1"
        ;;

      --stop_time )
        shift
        local stop_time="$1"
        ;;

    esac
    shift
  done

  [[ -z "$audio_device" ]] && local audio_device=`get_audio_device_selection`
  [[ -z "$input_format" ]] && local input_format=`default_audio_input_format`
  [[ -z "$output_format" ]] && local output_format=`default_audio_output_format`
  [[ -z "$channels" ]] && local channels=`default_number_of_audio_channels`
  [[ -z "$sample_rate" ]] && local sample_rate=`default_sample_rate`
  [[ -z "$max_threads" ]] && local max_threads=`default_max_threads`
  [[ -z "$stop_time" ]] && local stop_time=`default_stop_time`
  [[ -z "$output_dir" ]] && local output_dir=`default_output_dir`
  [[ -z "$output_name" ]] && local output_name=`default_output_audio_capture_file_name`
  
  local output_location="${output_dir}/${output_name}.wav"

  echo "$audio_device" "$input_format" "$output_format" "$channels" "$sample_rate" "$max_threads" "$stop_time" "$output_location"
}

