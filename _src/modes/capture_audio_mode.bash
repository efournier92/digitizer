#!/bin/bash

#----------------
# Name          : audio_mode.bash
# Description   : Run capture process to collect input from a stream
#----------------

get_capture_audio_command() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local audio_device="$1"
  local input_format="$2"
  local output_format="$3"
  local channels="$4"
  local sample_rate="$5"
  local threads="$6"
  local stop_time="$7"
  local output_location="$8"

  [[ -z "$audio_device" || -z "$input_format" || -z "$channels" || -z "$sample_rate" || -z "$threads" || -z "$stop_time" || -z "$output_location" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"
  
  echo "ffmpeg -f $input_format -channels $channels -sample_rate $sample_rate -thread_queue_size $threads -i $audio_device -t $stop_time -f $output_format - | ffmpeg -i - -c copy $output_location -c copy -f $output_format pipe:play | ffplay -i pipe:play -nodisp"
}

run_capture_command() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local ffmpeg_command="$1"

  [[ -z "$ffmpeg_command" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  eval "$ffmpeg_command"
}

capture_audio_mode() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local ffmpeg_command=`get_capture_audio_command "$@"`

  [[ -z "$ffmpeg_command" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"
  echo "$ffmpeg_command" >&2
  run_capture_command "$ffmpeg_command"
}

