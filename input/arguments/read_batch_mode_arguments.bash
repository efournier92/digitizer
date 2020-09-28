source $(dirname $0)/constants/video_defaults.bash

usage() {
  echo "Usage"
}

read_batch_mode_arguments() {
  local i=0
  while [ "$1" != "" ]; do
    case $1 in
      -m | --mode )
        shift
        local mode="$1"
        ;;

      -i | --input )
        shift
        local input="$1"
        ;;
    esac
    shift
  done

  [[ -z "$mode" ]] && local mode="test"
  [[ -z "$input" ]] && local input=`get_video_device_selection`
  
  echo "$input"
}

