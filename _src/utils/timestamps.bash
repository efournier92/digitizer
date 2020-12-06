#!/bin/bash

#----------------
# Name          : timestamps.bash
# Description   : Utility functions for returning timestamps
#----------------

source "./_src/messages/logs.bash"
source "./_src/messages/errors.bash"

get_duration_between_timestamps() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local start_time="$1"
  local end_time="$2"

  [[ -z "$start_time" || -z "$end_time" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  local duration=`subtract_timestamps "$start_time" "$end_time"`

  echo "$duration"
} 

subtract_timestamps() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local time_start="$1"
  local time_end="$2"

  [[ -z "$time_start" || -z "$time_end" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"
  
  IFS=':.'
  read -a start_elements <<< "$time_start"
  local start_hours=$((10#${start_elements[0]}))
  local start_minutes=$((10#${start_elements[1]}))
  local start_seconds=$((10#${start_elements[2]}))
  local start_ms=$((10#${start_elements[3]}))

  read -a end_elements <<< "$time_end"
  local end_hours=$((10#${end_elements[0]}))
  local end_minutes=$((10#${end_elements[1]}))  
  local end_seconds=$((10#${end_elements[2]}))  
  local end_ms=$((10#${end_elements[3]}))  

  local duration_hours="$((end_hours - start_hours))"
  local duration_minutes="$((end_minutes - start_minutes))"
  local duration_seconds="$((end_seconds - start_seconds))"
  local duration_ms="$((end_ms - start_ms))"

  IFS=' '
  echo $(correct_timestamp_negatives "$duration_hours" "$duration_minutes" "$duration_seconds" "$duration_ms")
}

correct_timestamp_negatives() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local hours="$1"
  local minutes="$2"
  local seconds="$3"
  local ms="$4"

  [[ -z "$hours" || -z "$hours" || -z "$minutes"  || -z "$seconds" || -z "$ms" ]] && error_missing_function_args "correct_timestamp_negatives"
  
  if [[ "$ms" -le -1 ]]; then
    seconds="$((seconds - 1))"
    ms="$((1000 + ms))"
  fi

  if [[ "$seconds" -le -1 ]]; then
    minutes="$((minutes - 1))"
    seconds="$((seconds + 60))"
  fi

  if [[ "$minutes" -le -1 ]]; then
    hours="$((hours - 1))"
    minutes="$((minutes + 60))"
  fi

  if [[ "$hours" -le -1 ]]; then
    hours="0"
  fi

  hours=`pad_timestamp_value "$hours" 2`
  minutes=`pad_timestamp_value "$minutes" 2`
  seconds=`pad_timestamp_value "$seconds" 2`
  ms=`pad_timestamp_value "$ms" 3`

  echo "$hours:$minutes:$seconds.$ms"
}

pad_timestamp_value() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local value="${1}"
  local digits="${2}"

  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  [[ -z "$value" || -z "$digits" ]] && error_missing_function_args "pad_timestamp_value"
  
  printf "%0${digits}d\n" $((10#${value}))
}


