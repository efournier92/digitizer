#!/bin/bash

#----------------
# Name          : audio_args.bash
# Description   : Interprets command arguments for capture mode
#----------------

source "./_src/utils/constants.bash"
source "./_src/utils/time.bash"
source "./_src/input/device_select.bash"
source "./_src/messages/logs.bash"
source "./_src/messages/errors.bash"

read_capture_audio_args() {
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
        local input_format="$1"
        ;;

      -fo | --output_format )
        shift
        local output_format="$1"
        ;;

      -t | --stop_time )
        shift
        local stop_time="$1"
        ;;

      -c | --num_channels )
        shift
        local num_channels="$1"
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

    esac
    shift
  done

  [[ -z "$audio_device" ]] && local audio_device=`get_audio_device_selection`
  [[ -z "$input_format" ]] && local input_format=`default_audio_input_format`
  [[ -z "$output_format" ]] && local output_format=`default_audio_output_format`
  [[ -z "$num_channels" ]] && local num_channels=`default_number_of_audio_channels`
  [[ -z "$sample_rate" ]] && local sample_rate=`default_audio_sample_rate`
  [[ -z "$max_threads" ]] && local max_threads=`default_max_threads`
  [[ -z "$stop_time" ]] && local stop_time=`default_audio_stop_time`
  [[ -z "$output_dir" ]] && local output_dir=`default_output_dir`
  [[ -z "$output_name" ]] && local output_name=`default_audio_file_name`
  
  local output_location="${output_dir}/${output_name}"

  echo "$audio_device" "$input_format" "$output_format" "$num_channels" "$sample_rate" "$max_threads" "$stop_time" "$output_location"
}

