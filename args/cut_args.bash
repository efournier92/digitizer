#!/bin/bash

#----------------
# Name          : read_cut_arguments
# Description   : Interprets command arguments for cut mode
# Arguments     : $@
#----------------

source $(dirname $0)/input/selection/select_device.bash
source $(dirname $0)/constants/defaults.bash
source $(dirname $0)/utilities/time.bash

read_cut_args() {
  local i=0
  while [ "$1" != "" ]; do
    case $1 in
      -i | --input_file )
        shift
        local input_file="$1"
        ;;

      -ss | --start_time )
        shift
        local start_time="$1"
        ;;

      -t | --stop_time )
        shift
        local queue_size="$1"
        ;;

      -c | --codec )
        shift
        local codec="$1"
        ;;

      -d | --dimensions )
        shift
        local demensions="$1"
        ;;

      -d | --output_directory )
        shift
        local output_directory="$1"
        ;;

      -o | --output_name )
        shift
        local output_name="$1"
        ;;

      --tune )
        shift
        local tune="$1"
        ;;

      --preset )
        shift
        local preset="$1"
        ;;

      --crop )
        shift
        local crop="$1"
        ;;

      --queue_size )
        shift
        local queue_size="$1"
        ;;

      --crf )
        shift
        local crf="$1"
        ;;

    esac
    shift
  done

  [[ -z "$input_file" ]] && print_help_info && exit
  [[ -z "$start_time" ]] && local start_time=`default_start_time`
  [[ -z "$stop_time" ]] && local stop_time=`default_stop_time`
  [[ -z "$codec" ]] && local codec=`default_video_codec`
  [[ -z "$dimensions" ]] && local dimensions=`default_dimensions`
  [[ -z "$tune" ]] && local tune=`default_tune`
  [[ -z "$preset" ]] && local preset=`default_preset`
  [[ -z "$crop" ]] && local crop=`default_crop`
  [[ -z "$queue_size" ]] && local queue_size=`default_max_queue`
  [[ -z "$crf" ]] && local crf=`default_crf`
  [[ -z "$output_directory" ]] && local output_directory=`default_output_directory`
  [[ -z "$output_name" ]] && local output_name=`time_now`
  
  local output_location="${output_directory}/${output_name}.mp4"
  
  # TODO: Move
  #mkdir -p "$output_directory"

  echo "$input_file" "$start_time" "$stop_time" "$codec" "$dimensions" "$tune" "$preset" "$crop" "$queue_size" "$crf" "$output_location"
}

