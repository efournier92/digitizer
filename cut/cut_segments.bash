#!/bin/bash

#----------------
# Name          : cut_segments
# Description   : Cuts sections from $input_file by start and end timestamps
# Arguments     : $input_file
#----------------

source $(dirname $0)/constants/video_defaults.bash

pad_value() {
  local value="${1}"
  local digits="${2}"
  
  printf "%0${digits}d\n" $((10#${value}))
}

correct_negatives() {
  local hours="$1"
  local minutes="$2"
  local seconds="$3"
  local ms="$4"
  
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
  local time_start="$1"
  local time_end="$2"
  
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

run_ffmpeg() {
  time_start="$1"
  time_end="$2"
  file_input="$3"
  file_output="$4"

  touch `get_pending_commands_file`

  echo "ffmpeg -i $(pwd)/$file_input -ss $time_start -c:v `get_default_video_codec` -crf `get_default_crf` -tune `get_default_tuning` -preset `get_default_preset` -vf 'yadif=0:0:0,crop=`get_default_crop`,scale=`get_default_dimensions`' -profile:v baseline -level 3.0 -pix_fmt yuv420p -c:a aac -ac 2 -b:a 128k -max_muxing_queue_size `get_default_max_queue` -t $time_end -movflags faststart `get_video_output_dir`/${file_output}.mp4" >> `get_pending_commands_file`
}

get_output_folder() {
  local input_file="$1"

  echo "`get_video_output_dir`/${input_file%%.*}"
}

get_output_file() {
  local input_file="$1"
  local output_file_name="$2"

  local output_folder=`get_output_folder "$input_file"`

  echo "${output_folder}/${output_file_name}.mp4"
}

capture_segment() {
  local input_file="$1"
  local start_time=""
  local end_time=""
  local output_file=""
  local timestamp_regex="[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}"
  
  until [[ "$start_time" =~ $timestamp_regex ]]; do
    read -p "START [hh:mm:ss.mss] >> " start_time
  done

  until [[ "$end_time" =~ $timestamp_regex ]]; do
    read -p "END   [hh:mm:ss.mss] >> " end_time
  done

  local duration=`subtract_timestamps "$start_time" "$end_time"`

  read -p "NAME >> " output_file_name

  run_ffmpeg "$start_time" "$duration" "$input_file" "$output_file_name"
} 

open_ffplay() {
  local input_file="$1"

  nohup ffplay \
    -vf "drawtext=text='%{pts\:hms}':fontsize=30:box=1:x=(w-tw)/2:y=h-(2*lh)" \
    -x 1000 -y 1000 \
    "$input_file" &
}

cut_segments() {
  local input_file="$1"

  mkdir -p `get_output_folder "$input_file"`
  open_ffplay "$input_file"
  sleep 1

  while true; do
    capture_segment "$input_file"
  done
}

