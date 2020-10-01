#!/bin/bash

#----------------
# Name          : 
# Description   : 
# Arguments     : 
#----------------

source ./help/errors.bash

create_concat_file() {
  local files_to_join="$1"
  local output_dir="$2"
  local concat_file_location="$3"

  [[ "$files_to_join" == "" || -z "$output_dir" || -z "$concat_file_location" ]] && error_missing_function_args "create_concat_file"

  touch "$concat_file_location"

  # Clear all text from concat file
  > "$concat_file_location"

  IFS=','
  read -ra files <<< "$files_to_join"
  for file in "${files[@]}"; do
    [[ -f "$file" ]] && error_join_file_missing "$file"
    echo "file '$file'" >> $concat_file_location
  done
}

get_ffmpeg_command() {
  local concat_file_location="$1"
  local output_dir="$2"
  local output_name="$3"

  [[ -z "$concat_file_location" || -z "$output_dir" || -z "$output_name" ]] && error_missing_function_args "get_ffmpeg_command"

  echo "ffmpeg -f concat -safe 0 -i $concat_file_location -c copy $output_dir/$output_name.mp4"
}

run_ffmpeg_command() {
  local ffmpeg_command="$1"
  
  [[ -z "$ffmpeg_command" ]] && error_missing_function_args "run_ffmpeg_command"

  eval "$ffmpeg_command"
}

join_mode() {
  local files_to_join="$1"
  local output_dir="$2"
  local output_name="$3"
  
  echo "FILES: $files_to_join" >&2
  [[ "$files_to_join" == "" || -z "$output_dir" || -z "$output_name" ]] && error_missing_function_args "join_mode"
  
  local concat_file_location="$output_dir/`default_concat_file_name`"

  create_concat_file "$files_to_join" "$output_dir" "$concat_file_location"
  local ffmpeg_command=`get_ffmpeg_command "$concat_file_location" "$output_dir" "$output_name"`
  run_ffmpeg_command "$ffmpeg_command"
}

