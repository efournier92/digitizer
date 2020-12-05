#!/bin/bash

#----------------
# Name          : cut_video_mode.bash
# Description   : Run video-cut process to output ffmpeg commands to a file for batch conversion
#----------------

source "./_src/messages/logs.bash"
source "./_src/input/cut_options.bash"
source "./_src/utils/constants.bash"
source "./_src/utils/fs.bash"
source "./_src/utils/ffmpeg.bash"
source "./_src/utils/time.bash"
source "./_src/utils/timestamps.bash"

get_ffmpeg_cut_video_command() {
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

cut_video_mode() {
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
    local duration=`get_duration_between_timestamps "$start_time" "$end_time"`

    local name=`get_segment_name "$input_file"`
    
    ffmpeg_command="`get_ffmpeg_cut_video_command $input_file $duration $codec $dimensions $tune $preset $crop $queue_size $crf $output_dir $name`"
  
    get_save_ffmpeg_command "$ffmpeg_command"
  done
}

