#!/bin/bash

#----------------
# Name          : join_mode.bash
# Description   : Run join process to combine multiple inputs into a single video
#----------------

source $(dirname $0)/__source/messages/errors.bash
source $(dirname $0)/__source/messages/logs.bash

create_concat_file() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local files_to_join="$1"
  local output_dir="$2"
  local concat_file_location="$3"

  [[ "$files_to_join" == "" || -z "$output_dir" || -z "$concat_file_location" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  touch "$concat_file_location"

  # Clear all text from concat file
  > "$concat_file_location"

  IFS=','
  read -ra files <<< "$files_to_join"
  for file in "${files[@]}"; do
    [[ ! -f "$file" ]] && error_file_not_found "$file" "${FUNCNAME[0]}"
    echo "file '$file'" >> $concat_file_location
  done
}

get_ffmpeg_command() {
  "[[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" $@"
  local concat_file_location="$1"
  local output_dir="$2"
  local output_name="$3"

  [[ -z "$concat_file_location" || -z "$output_dir" || -z "$output_name" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  echo "ffmpeg -f concat -safe 0 -i $concat_file_location -c copy $output_dir/$output_name.mp4"
}

run_ffmpeg_command() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local ffmpeg_command="$1"
  
  [[ -z "$ffmpeg_command" ]] && error_missing_function_args "run_ffmpeg_command"

  eval "$ffmpeg_command"
}

join_mode() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local files_to_join="$1"
  local output_dir="$2"
  local output_name="$3"
  
  echo "FILES: $files_to_join" >&2
  [[ "$files_to_join" == "" || -z "$output_dir" || -z "$output_name" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  local concat_file_location="$output_dir/`default_concat_file_name`"

  create_concat_file "$files_to_join" "$output_dir" "$concat_file_location"
  local ffmpeg_command=`get_ffmpeg_command "$concat_file_location" "$output_dir" "$output_name"`
  run_ffmpeg_command "$ffmpeg_command"
}

