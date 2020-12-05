#!/bin/bash

#----------------
# Name          : join_args.bash
# Description   : Reads command arguments for join mode
# Arguments     : $@
#----------------

source "./_src/utils/constants.bash"
source "./_src/messages/logs.bash"
source "./_src/messages/errors.bash"

trim_leading_comma() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local files_to_join="$1"

  echo ${files_to_join#*,}
}

read_join_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
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

  [[ -z "$files_to_join" ]] && error_missing_required_arg "input" "${FUNCNAME[0]}"
  [[ -z "$output_name" ]] && error_missing_required_arg "output_name" "${FUNCNAME[0]}"
  [[ -z "$output_dir" ]] && local output_dir=`default_output_dir`

  files_to_join=`trim_leading_comma "$files_to_join"`

  echo "$files_to_join" "$output_dir" "$output_name"
}

