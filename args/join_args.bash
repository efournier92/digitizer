#!/bin/bash

#----------------
# Name          : join_args
# Description   : Reads command arguments for join mode
# Arguments     : $@
#----------------

source $(dirname $0)/constants/defaults.bash
source $(dirname $0)/messages/help.bash

trim_leading_whitespace() {
  local files_to_join="$1"
  echo ${files_to_join#*,}
}

read_join_args() {

  while [ "$1" != "" ]; do

    case $1 in
      -i | --input )
        shift
        local files_to_join="$files_to_join,$1"
        ;;

      -d | --output_dir )
        shift
        local output_dir="$1"
        ;;

      -o | --output_name )
        shift
        local output_name="$1"
        ;;

    esac
    shift
  done

  [[ -z "$files_to_join" ]] && show_help `join_mode_name`
  [[ -z "$output_dir" ]] && local output_dir=`default_output_directory`
  [[ -z "$output_name" ]] && show_help `join_mode_name`

  files_to_join=`trim_leading_whitespace "$files_to_join"`

  echo "$files_to_join" "$output_dir" "$output_name"
}

