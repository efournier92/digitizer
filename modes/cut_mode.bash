#!/bin/bash

#----------------
# Name          : cut_mode
# Description   : Run cut process to output ffmpeg commands to a file for batch conversion
# Arguments     : $input_file
#----------------

source $(dirname $0)/constants/defaults.bash

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

get_ffmpeg_command() {
  local input_file="$1"
  local start_time="$2"
  local duration="$3"
  local codec="$4"
  local dimensions="$5"
  local tune="$6"
  local preset="$7"
  local crop="$8"
  local queue_size="$9"
  local crf="${10}"
  local output_dir="${11}"
  local output_file_name="${12}"

  echo "DIR: $output_dir" >&2
  echo "FILE: $output_file_name" >&2

  echo "ffmpeg -i $(pwd)/$input_file -ss $start_time -c:v $codec -crf $crf -tune $tune -preset $preset -vf yadif=0:0:0,crop=$crop,scale=$dimensions -profile:v baseline -level 3.0 -pix_fmt yuv420p -c:a aac -ac 2 -b:a 128k -max_muxing_queue_size $queue_size -t $duration -movflags faststart $output_dir/$output_file_name.mp4"
}

save_ffmpeg_command() {
  local ffmpeg_command="$1"
  local output_dir="$2"
  
  local batch_file="$output_dir/`default_batch_file_name`"
  mkdir -p "$output_dir"
  touch "$batch_file"

  echo "$ffmpeg_command" >> "$batch_file"
}

get_output_file() {
  local output_dir="$1"
  local output_name="$2"

  echo "$output_dir/$output_name.mp4"
}

get_duration() {
  local start_time="$1"
  local end_time="$2"

  local duration=`subtract_timestamps "$start_time" "$end_time"`

  echo "$duration"
} 

get_start_time() {
  local start_time=""

  until [[ "$start_time" =~ `timestamp_regex` ]]; do
    read -p "START [hh:mm:ss.mss] >> " start_time
  done

  echo "$start_time"
}

get_end_time() {
  local end_time=""

  until [[ "$end_time" =~ `timestamp_regex` ]]; do
    read -p "END   [hh:mm:ss.mss] >> " end_time
  done
  
  echo "$end_time"
}

get_segment_name() {
  read -p "NAME >> " output_file_name
  echo "$output_file_name"
}

open_ffplay() {
  local input_file="$1"

  nohup ffplay \
    -vf "drawtext=text='%{pts\:hms}':fontsize=30:box=1:x=(w-tw)/2:y=h-(2*lh)" \
    -x 1000 -y 1000 \
    "$input_file" &
}

cut_mode() {
  local input_file="$1"
  local start_time="$2"
  local stop_time="$3"
  local codec="$4"
  local dimensions="$5"
  local tune="$6"
  local preset="$7"
  local crop="$8"
  local queue_size="$9"
  local crf="${10}"
  local output_dir="${11}"

  mkdir -p "$output_dir"
  open_ffplay "$input_file"
  sleep 1

  while true; do
    local start_time=`get_start_time`
    local end_time=`get_end_time`
    local duration=`get_duration "$start_time" "$end_time"`

    local name=`get_segment_name "$input_file"`

    local ffmpeg_command=`get_ffmpeg_command "$input_file" "$start_time" "$duration" "$codec" "$dimensions" "$tune" "$preset" "$crop" "$queue_size" "$crf" "$output_dir" "$name"`
  
    save_ffmpeg_command "$ffmpeg_command" "$output_dir" 
  done
}

