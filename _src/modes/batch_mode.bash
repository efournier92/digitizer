#!/bin/bash

#----------------
# Name          : batch_mode.bash
# Project       : digitizer
# Description   : Run batch process to convert raw captures from ffmpeg commands in $batch_file
#----------------

source "./_src/messages/errors.bash"

get_output_dir() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local ffmpeg_command="$1"

  local output_location=`echo $ffmpeg_command | awk '{print $NF}'`

  echo ${output_location%/*}
}

create_output_dir() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local ffmpeg_command="$1"

  local output_dir=`get_output_dir "$ffmpeg_command"`
  
  mkdir "$output_dir"
}

batch_mode() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local batch_file="$1"

  [[ -z "$batch_file" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"
  [[ ! -f "$batch_file" ]] && error_file_not_found "$batch_file" `batch_mode_name`

  while IFS= read -r command; do
    create_output_dir "$command"

    eval "$command < /dev/null"
  done < "$batch_file"
}

