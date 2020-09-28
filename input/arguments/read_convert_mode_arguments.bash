source $(dirname $0)/input/selection/select_device.bash
source $(dirname $0)/constants/video_defaults.bash
source $(dirname $0)/utilities/time.bash

usage() {
  echo "Usage"
}

read_convert_mode_arguments() {
  local i=0
  while [ "$1" != "" ]; do
    case $1 in
      -m | --mode )
        shift
        local mode="$1"
        ;;

      -i | --input | --video_device )
        shift
        local input="$1"
        ;;

      -a | --audio_input )
        shift
        local audio_input="$1"
        ;;

      -d | --output_dir )
        shift
        local output_dir="$1"
        ;;

      -o | --output_name )
        shift
        local output_name="$1"
        ;;

      --size )
        shift
        local dimensions="$1"
        ;;

      --crf )
        shift
        local crf="$1"
        ;;

      --preset )
        shift
        local preset="$1"
        ;;

      --yadif )
        shift
        local yadif="$1"
        ;;

      --crop )
        shift
        local crop="$1"
        ;;

      -h | --help )
        usage
        exit
        ;;

      * )
        #usage
        ;;

    esac
    shift
  done

  [[ -z "$mode" ]] && local mode="test"
  [[ -z "$input" ]] && local input=`get_video_device_selection`
  [[ -z "$dimensions" ]] && local dimensions=`get_default_dimensions`
  [[ -z "$crf" ]] && local crf=`get_default_crf`
  [[ -z "$preset" ]] && local preset=`get_default_preset`
  [[ -z "$crop" ]] && local crop=`get_default_crop`
  [[ -z "$output_dir" ]] && local output_dir="`get_default_output_dir`"
  [[ -z "$output_name" ]] && local output_name="$input"
  
  local output_location="$output_dir/$output_name"

  mkdir -p "$output_dir"

  echo "$mode" "$input" "$dimensions" "$crf" "$preset" "$crop" "$output_location"
}

