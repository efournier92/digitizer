#!/bin/bash

#----------------
# Name          : cut_mode.bash
# Description   : Run cut process to output ffmpeg commands to a file for batch conversion
#----------------

source ./constants/defaults.bash
source ./messages/logs.bash
source ./utilities/time.bash
source ./utilities/fs.bash

pad_value() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local value="${1}"
  local digits="${2}"

  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  [[ -z "$value" || -z "$digits" ]] && error_missing_function_args "pad_value"
  
  printf "%0${digits}d\n" $((10#${value}))
}

correct_negatives() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local hours="$1"
  local minutes="$2"
  local seconds="$3"
  local ms="$4"

  [[ -z "$hours" || -z "$hours" || -z "$minutes"  || -z "$seconds" || -z "$ms" ]] && error_missing_function_args "correct_negatives"
  
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

  hours=`pad_value "$hours" 2`
  minutes=`pad_value "$minutes" 2`
  seconds=`pad_value "$seconds" 2`
  ms=`pad_value "$ms" 3`

  echo "$hours:$minutes:$seconds.$ms"
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
  echo $(correct_negatives "$duration_hours" "$duration_minutes" "$duration_seconds" "$duration_ms")
}

get_ffmpeg_cut_command() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local input_file="$1"
  local duration="$2"
  local codec="$3"
  local dimensions="$4"
  local tune="$5"
  local preset="$6"
  local crop="$7"
  local queue_size="$8"
  local crf="${9}"
  local output_dir="${10}"
  local output_file_name="${11}"

  [[ -z "$input_file" || -z "$duration" || -z "$codec" || -z "$dimensions" || -z "$tune" || -z "$preset" || -z "$crop" || -z "$queue_size" || -z "$crf" || -z "$output_dir" || -z "$output_file_name" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  echo "ffmpeg -i $(pwd)/$input_file -ss $start_time -c:v $codec -crf $crf -tune $tune -preset $preset -vf yadif=0:0:0,crop=$crop,scale=$dimensions -profile:v baseline -level 3.0 -pix_fmt yuv420p -c:a aac -ac 2 -b:a 128k -max_muxing_queue_size $queue_size -t $duration -movflags faststart $output_dir/$output_file_name.mp4"
}

save_ffmpeg_command() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local ffmpeg_command="$1"

  [[ -z "$ffmpeg_command" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"
  
  local batch_file=`batch_file_location`

  echo "$ffmpeg_command" >> "$batch_file"
}

get_duration() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local start_time="$1"
  local end_time="$2"

  [[ -z "$start_time" || -z "$end_time" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  local duration=`subtract_timestamps "$start_time" "$end_time"`

  echo "$duration"
} 

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

cut_mode() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local input_file="$1"
  local codec="$2"
  local dimensions="$3"
  local tune="$4"
  local preset="$5"
  local crop="$6"
  local queue_size="$7"
  local crf="$8"
  local no_encode="$9"
  local output_dir="${10}"
  
  [[ -z "$input_file" || -z "$codec" || -z "$dimensions" || -z "$tune" || -z "$preset" || -z "$crop" || -z "$queue_size" || -z "$crf" || -z "$output_dir" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  [[ ! -f "$input_file" ]] && error_file_not_found "$input_file" "${FUNCNAME[0]}"

  open_ffplay "$input_file"
  sleep 0.2
  
  local ffmpeg_command
  while true; do
    local start_time=`get_start_time`
    local end_time=`get_end_time`
    local duration=`get_duration "$start_time" "$end_time"`

    local name=`get_segment_name "$input_file"`
    
    ffmpeg_command="`get_ffmpeg_cut_command $input_file $duration $codec $dimensions $tune $preset $crop $queue_size $crf $output_dir $name`"
  
    save_ffmpeg_command "$ffmpeg_command"
  done
}

