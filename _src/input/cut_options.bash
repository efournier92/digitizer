#!/bin/bash

#----------------
# Name          : cut_options.bash
# Description   : Run cut process to output ffmpeg commands to a file for batch conversion
#----------------

get_start_time() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local start_time=""

  until [[ "$start_time" =~ `timestamp_regex` ]]; do
    read -p "START [hh:mm:ss.mss] >> " start_time
  done

  echo "$start_time"
}

get_end_time() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local end_time=""

  until [[ "$end_time" =~ `timestamp_regex` ]]; do
    read -p "END   [hh:mm:ss.mss] >> " end_time
  done
  
  echo "$end_time"
}

get_segment_name() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"

  read -p "NAME >> " output_file_name

  echo "$output_file_name"
}

