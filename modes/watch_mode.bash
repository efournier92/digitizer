#!/bin/bash

#----------------
# Name          : 
# Description   : 
# Author        : E Fournier
# Dependencies  : 
# Arguments     : 
# Example Usage : 
#----------------

source $(dirname $0)/messages/logs.bash
source $(dirname $0)/messages/errors.bash

get_ffplay_command() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local video_device="$1"
  local audio_device="$2"

  [[ -z "$video_device" || -z "$audio_device" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  echo "ffplay -standard `default_standard` -i $video_device -i $audio_device"
}

run_ffplay_command() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local ffplay_command="$1"

  [[ -z "$ffmpeg_command" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  eval "$ffplay_command"
}

watch_mode() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local video_device="$1"
  local audio_device="$2"

  [[ -z "$video_device" || -z "$audio_device" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  run_ffplay_command `get_ffplay_command video_device`
}

