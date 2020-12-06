#!/bin/bash

#----------------
# Name          : ffmpeg.bash
# Project       : digitizer
# Description   : Run cut process to output ffmpeg commands to a file for batch conversion
#----------------

get_save_ffmpeg_command() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local ffmpeg_command="$1"

  [[ -z "$ffmpeg_command" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"
  
  local batch_file=`batch_file_location`

  echo "$ffmpeg_command" >> "$batch_file"
}

open_ffplay() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local input_file="$1"

  [[ -z "$input_file" ]] && error_missing_function_args "${FUNCNAME[0]}"

  local nohup_file=`nohup_file_location` 

  nohup ffplay \
    -vf "drawtext=text='%{pts\:hms}':fontsize=30:box=1:x=(w-tw)/2:y=h-(2*lh)" \
    -x 1000 -y 1000 \
    "$input_file" > "$nohup_file" &
}

