#!/bin/bash

#----------------
# Name          : cut_arg.bash
# Description   : Interprets command arguments for cut mode
#----------------

source $(dirname $0)/input/selection/select_device.bash
source $(dirname $0)/constants/defaults.bash
source $(dirname $0)/utilities/fs.bash
source $(dirname $0)/utilities/time.bash
source $(dirname $0)/messages/logs.bash
source $(dirname $0)/messages/errors.bash

read_cut_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local i=0
  while [ "$1" != "" ]; do
    case $1 in
      -i | --input_file )
        shift
        local input_file="$1"
        ;;

      -c | --codec )
        shift
        local codec="$1"
        ;;

      -d | --output_dir )
        shift
        local output_dir="$1"
        ;;

      -x | --no_encode )
        local no_encode=true
        ;;

      --crf )
        shift
        local crf="$1"
        ;;

      --crop )
        shift
        local crop="$1"
        ;;

      --dimensions )
        shift
        local demensions="$1"
        ;;

      --preset )
        shift
        local preset="$1"
        ;;

      --queue_size )
        shift
        local queue_size="$1"
        ;;

      --tune )
        shift
        local tune="$1"
        ;;

    esac
    shift
  done

  [[ -z "$input_file" ]] && error_missing_required_arg "input_file" "${FUNCNAME[0]}"
  [[ -z "$codec" ]] && local codec=`default_video_codec`
  [[ -z "$dimensions" ]] && local dimensions=`default_dimensions`
  [[ -z "$tune" ]] && local tune=`default_tune`
  [[ -z "$preset" ]] && local preset=`default_preset`
  [[ -z "$crop" ]] && local crop=`default_crop`
  [[ -z "$queue_size" ]] && local queue_size=`default_max_queue`
  [[ -z "$crf" ]] && local crf=`default_crf`
  [[ -z "$no_encode" ]] && local no_encode=false
  [[ -z "$output_dir" ]] && local output_dir=`default_output_dir`

  echo "$input_file" "$codec" "$dimensions" "$tune" "$preset" "$crop" "$queue_size" "$crf" "$no_encode" "$output_dir"
}

