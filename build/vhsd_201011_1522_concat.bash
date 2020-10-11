#!/bin/bash




log_arguments() {
  local function_name="$1"
  local arguments="$2"

  echo "INFO: $function_name [$arguments]" >&2
}



error_missing_function_args() {
  local function_name="$1"
  local args="$2"

  echo "ERROR: Arguments missing from called function $function_name [$args]"

  exit
}

error_missing_required_arg() {
  local required_arg="$1"
  local function_name="$2"

  echo "ERROR: required argument [$required_arg] not found in function $function_name"

  exit
}

error_file_not_found() {
  local file=$1
  local function_name="$2"

  echo "ERROR: input file [$file] not found in function $function_name"

  exit
}

error_dir_not_found() {
  local dir=$1
  local function_name="$2"

  echo "ERROR: directory [$file] not found in function $function_name"

  exit
}

error_device_not_found() {
  local device="$1"
  local function_name="$2"

  echo "ERROR: Device [$device] was not found in function $function_name"

  exit
}

error_mode_not_found() {
  local mode="$1"
  local function_name="$2"

  echo "ERROR: Mode [$mode] was not found in function $function_name"

  exit
}



help_header() {
cat << EOF
VHSD | VHS Digitizer
EOF
}

help_general() {
cat << EOF
GENERAL

  -h, --help [mode]    print help information [for mode]

  -m, --mode           enable mode [capture|cut|batch|join]

  -v, --verbose        enable verbose debugging info

EOF
}

help_capture() {
cat << EOF
CAPTURE

  -i, --input,         input video devide
  --video_device

  -a, --audio_device   input audio device

  -c, --codec          

  -t, --stop_time      maximum capture duration

  -d, --output_dir     directory in which to save the capture

  -o, --output_name    name for the capture file

  --video_format       output video format []

  --audio_format       output audio format []

  --crf                output constant rate factor

  --preset             preset for capture process []

  --size               

  --standard           input stream standard [ntsc,pal,...]

  --threads            maximum threads for process

  --tune               tuning for capture output [film,...]

EOF
}

help_cut() {
cat << EOF
CUT

  -i, --input_file     input video devide

  -ss, --h

  -d, --output_dir     directory in which to save the capture

  -o, --output_name    name for the capture file
  
  --crf

  --crop               

  --dimensions

  --tune               video tuning for the output file [film,...]

  --preset             preset for the encoding process []

  --queue_size

  --tune               

EOF
}

help_batch() {
cat << EOF
BATCH

  -i, --input,         
  --batch_file         batch text file created in cut mode

EOF
}

help_join() {
cat << EOF
JOIN

  -i, --input,         batch text file created in cut mode


  -d, --output_dir     directory in which to save the joined file

  -o, --output_name    name for the joined file

EOF
}

help_watch() {
cat << EOF
WATCH

  -i, --input,         input video devide
  --video_device

  -a, --audio_device   input audio device

EOF
}

print_help_capture() {
  help_header
  help_capture
}

print_help_cut() {
  help_header
  help_cut
}

print_help_batch() {
  help_header
  help_batch
}

print_help_join() {
  help_header
  help_join
}

print_help_watch() {
  help_header
  help_watch
}

print_help_all() {
  help_header
  help_general
  help_capture
  help_cut
  help_batch
  help_join
  help_watch
}

print_help_by_mode() {
  local mode="$1"
  
  if [[ "$mode" == `capture_mode_name` ]]; then
    print_help_capture
  elif [[ "$mode" == `cut_mode_name` ]]; then
    print_help_cut
  elif [[ "$mode" == `batch_mode_name` ]]; then
    print_help_batch
  elif [[ "$mode" == `join_mode_name` ]]; then
    print_help_join
  elif [[ "$mode" == `watch_mode_name` ]]; then
    print_help_watch
  else
    print_help_all
  fi
}

show_help() {
  local mode="$1"
  
  echo `print_help_by_mode "$mode"`

  exit
}



detect_video_devices() {
  echo `ls -d /dev/video*`
}

detect_audio_devices() {
  devices_path="/dev/snd/"
  available_device_builder="$(echo `ls -d ${devices_path}pcmC*D*c`)"
  available_device_builder="${available_device_builder//pcmC/hw:}"
  available_device_builder="${available_device_builder//c/}"
  available_device_builder="${available_device_builder//D/,}"
  available_audio_devices="${available_device_builder//${devices_path}/}"

  echo "${available_audio_devices}"
}




default_output_dir() {
  echo "$(pwd)"
}

config_dir() {
  echo "$HOME/.vhsd"
}

concat_file_name() {
  echo "_temp_concat.txt"
}

concat_file_location() {
  echo "`config_dir`/`concat_file_location`"
}

batch_file_name() {
  echo "batch.txt"
}

batch_file_location() {
  echo "`config_dir`/`batch_file_name`"
}

nohup_file_name() {
  echo "_nohup.out"
}

nohup_file_location() {
  echo "`config_dir`/`nohup_file_name`"
}



time_now() {
  echo $(date '+%y%m%d%H%M%S')
}

time_now_short() {
  echo $(date '+%H%M%S')
}

timestamp_regex() {
  echo "[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}"
}




capture_mode_name() {
  echo "capture"
}

cut_mode_name() {
  echo "cut"
}

batch_mode_name() {
  echo "batch"
}

join_mode_name() {
  echo "join"
}

watch_mode_name() {
  echo "watch"
}

default_input_video_size() {
  echo "640x480"
}

default_input_video_format() {
  echo "v4l2"
}

default_input_audio_format() {
  echo "alsa"
}

default_dimensions() {
  echo "720x540"
}

default_start_time() {
  echo "00:00:00.000"
}

default_stop_time() {
  echo "06:00:00.000"
}

default_crf() { 
  echo "28"
}

default_preset() {
  echo "slow"
}

default_crop() {
  echo "in_w-2*20:in_h-2*20"
}

default_video_codec() {
  echo "libx264"
}

default_tune() {
  echo "film"
}

default_standard() {
  echo "ntsc"
}

default_format() {
  echo "mpeg"
}

default_extension() {
  echo "mp4"
}

default_max_threads() {
  echo "512"
}

default_max_queue() {
  echo "400"
}




get_user_selection() {
  list_options="${1}"
  prompt_header="${2}"
  
  select selection in `${list_options}`; do
    echo "$selection"
  done
} 

get_video_device_selection() {
  select selection in `${list_options}`; do
    echo "$selection"
  done
}

get_audio_device_selection() {
  select selection in `${list_options}`; do
    echo "$selection"
  done
}




read_batch_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  while [ "$1" != "" ]; do

    case $1 in
      -i | --input | --batch_file )
        shift
        local input="$1"
        ;;

    esac
    shift
  done

  [[ -z "$input" ]] && error_missing_required_arg "input" "${FUNCNAME[0]}"

  echo "$input"
}




read_capture_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local i=0
  while [ "$1" != "" ]; do
    case $1 in
      -i | --input | --video_device )
        shift
        local video_device="$1"
        ;;

      -a | --audio_device )
        shift
        local audio_device="$1"
        ;;

      -c | --codec )
        shift
        local codec="$1"
        ;;

      -t | --stop_time )
        shift
        local stop_time="$1"
        ;;

      -d | --output_dir )
        shift
        local output_dir="$1"
        ;;

      -o | --output_name )
        shift
        local output_name="$1"
        ;;

      --video_format )
        shift
        local video_format="$1"
        ;;

      --crf )
        shift
        local crf="$1"
        ;;

      --preset )
        shift
        local preset="$1"
        ;;

      --size )
        shift
        local size="$1"
        ;;

      --standard )
        shift
        local standard="$1"
        ;;

      --threads )
        shift
        local threads="$1"
        ;;

      --tune )
        shift
        local tune="$1"
        ;;

    esac
    shift
  done

  [[ -z "$video_device" ]] && local video_device=`get_video_device_selection`
  [[ -z "$audio_device" ]] && local audio_device=`get_audio_device_selection`
  [[ -z "$codec" ]] && local codec=`default_video_codec`
  [[ -z "$crf" ]] && local crf=`default_crf`
  [[ -z "$video_format" ]] && local video_format=`default_input_video_format`
  [[ -z "$audio_format" ]] && local audio_format=`default_input_audio_format`
  [[ -z "$preset" ]] && local preset=`default_preset`
  [[ -z "$size" ]] && local size=`default_input_video_size`
  [[ -z "$standard" ]] && local standard=`default_standard`
  [[ -z "$stop_time" ]] && local stop_time=`default_stop_time`
  [[ -z "$threads" ]] && local threads=`default_max_threads`
  [[ -z "$tune" ]] && local tune=`default_tune`
  [[ -z "$output_format" ]] && local output_format=`default_format`
  [[ -z "$output_dir" ]] && local output_dir=`default_output_dir`
  [[ -z "$output_name" ]] && local output_name=`time_now`
  
  local output_location="${output_dir}/${output_name}.mp4"

  echo "$video_device" "$audio_device" "$codec" "$crf" "$video_format" "$audio_format" "$preset" "$size" "$standard" "$stop_time" "$threads" "$tune" "$output_format" "$output_location"
}




read_cut_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local i=0
  while [ "$1" != "" ]; do
    case $1 in
      -i | --input_file )
        shift
        local input_file="$1"
        ;;

      -c | --codec )
        shift
        local codec="$1"
        ;;

      -d | --output_dir )
        shift
        local output_dir="$1"
        ;;

      -x | --no_encode )
        local no_encode=true
        ;;

      --crf )
        shift
        local crf="$1"
        ;;

      --crop )
        shift
        local crop="$1"
        ;;

      --dimensions )
        shift
        local demensions="$1"
        ;;

      --preset )
        shift
        local preset="$1"
        ;;

      --queue_size )
        shift
        local queue_size="$1"
        ;;

      --tune )
        shift
        local tune="$1"
        ;;

    esac
    shift
  done

  [[ -z "$input_file" ]] && error_missing_required_arg "input_file" "${FUNCNAME[0]}"
  [[ -z "$codec" ]] && local codec=`default_video_codec`
  [[ -z "$dimensions" ]] && local dimensions=`default_dimensions`
  [[ -z "$tune" ]] && local tune=`default_tune`
  [[ -z "$preset" ]] && local preset=`default_preset`
  [[ -z "$crop" ]] && local crop=`default_crop`
  [[ -z "$queue_size" ]] && local queue_size=`default_max_queue`
  [[ -z "$crf" ]] && local crf=`default_crf`
  [[ -z "$no_encode" ]] && local no_encode=false
  [[ -z "$output_dir" ]] && local output_dir=`default_output_dir`

  echo "$input_file" "$codec" "$dimensions" "$tune" "$preset" "$crop" "$queue_size" "$crf" "$no_encode" "$output_dir"
}




read_help_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  while [ "$1" != "" ]; do
    case $1 in
      -h | --help )
        local should_show_help=true
        ;;

    esac
    shift
  done
 
  if [[ "$should_show_help" == true ]]; then
    print_help_by_mode "$mode"
    exit
  fi
}




trim_leading_comma() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local files_to_join="$1"

  echo ${files_to_join#*,}
}

read_join_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  while [ "$1" != "" ]; do

    case $1 in
      -i | --input )
        shift
        local files_to_join="$files_to_join,$1"
        ;;

      -d | --output_dir )
        shift
        local output_dir="$1"
        ;;

      -o | --output_name )
        shift
        local output_name="$1"
        ;;

    esac
    shift
  done

  [[ -z "$files_to_join" ]] && error_missing_required_arg "input" "${FUNCNAME[0]}"
  [[ -z "$output_name" ]] && error_missing_required_arg "output_name" "${FUNCNAME[0]}"
  [[ -z "$output_dir" ]] && local output_dir=`default_output_dir`

  files_to_join=`trim_leading_comma "$files_to_join"`

  echo "$files_to_join" "$output_dir" "$output_name"
}




read_mode_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  while [ "$1" != "" ]; do
    case $1 in
      -m | --mode )
        shift
        local mode="$1"
        ;;

    esac
    shift
  done
 
  [[ -z "$mode" ]] && error_missing_required_arg "mode" "${FUNCNAME[0]}"
  [[ `is_mode_known "$mode"` == false ]] && error_mode_not_found "$mode" "${FUNCNAME[0]}"

  echo "$mode"
}




read_verbose_args() {
  while [ "$1" != "" ]; do
    case $1 in
      -v | --verbose )
        local is_verbose="true"
        ;;

    esac
    shift
  done
 
  [[ -z "$is_verbose" ]] && local is_verbose="false"
  [[ "$is_verbose" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"

  echo "$is_verbose"
}




read_watch_args() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local i=0
  while [ "$1" != "" ]; do
    case $1 in
      -i | --input | --video_device )
        shift
        local video_device="$1"
        ;;

      -a | --audio_device )
        shift
        local audio_device="$1"
        ;;

    esac
    shift
  done

  [[ -z "$video_device" ]] && local video_device=`get_video_device_selection`
  [[ -z "$audio_device" ]] && local audio_device=`get_audio_device_selection`
  
  echo "$video_device" "$audio_device"
}




batch_mode() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local batch_file="$1"

  [[ -z "$batch_file" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"
  [[ ! -f "$batch_file" ]] && error_file_not_found "$batch_file" `batch_mode_name`

  while IFS= read -r command
  do
    eval "$command < /dev/null"
  done < "$batch_file"
}



get_capture_command() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local video_device="$1"
  local audio_device="$2"
  local codec="$3"
  local crf="$4"
  local video_format="$5"
  local audio_format="$6"
  local preset="$7"
  local size="$8"
  local standard="$9"
  local stop_time="${10}"
  local theads="${11}"
  local tune="${12}"
  local output_format="${13}"
  local output_location="${14}"

  [[ -z "$video_device" || -z "$audio_device" || -z "$codec" || -z "$crf" || -z "$video_format" || -z "$audio_format" || -z "$preset" || -z "$size" || -z "$standard" || -z "$stop_time" || -z "$theads" || -z "$tune" || -z "$output_format" || -z "$output_location" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"
  
  [[ ! -e "$video_device" ]] && error_device_not_found "$video_device" "${FUNCNAME[0]}"
  [[ ! -e "$audio_device" ]] && error_device_not_found "$audio_device" "${FUNCNAME[0]}"

  echo "ffmpeg -standard $standard -f $video_format -video_size $size -thread_queue_size $threads -i $video_device -f $audio_format -thread_queue_size $threads -i $audio_device -c:v $codec -tune $tune -preset $preset -crf $crf -t $stop_time -f $output_format - | ffmpeg -i - -c copy $output_location -c copy -f s32le pipe:play | ffplay -i pipe:play -nodisp"
}

run_capture_command() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local ffmpeg_command="$1"

  [[ -z "$ffmpeg_command" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  eval "$ffmpeg_command"
}

capture_mode() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local ffmpeg_command=`get_capture_command "$@"`

  [[ -z "ffmpeg_command" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  run_capture_command "$ffmpeg_command"
}




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

get_ffmpeg_cut_command_with_encoding() {
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

get_ffmpeg_cut_command_without_encoding() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local input_file="$1"
  local duration="$2"
  local output_dir="$3"
  local output_file_name="$4"

  [[ -z "$input_file" || -z "$duration" || -z "$output_dir" || -z "$output_file_name" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  echo "ffmpeg -i $(pwd)/$input_file -ss $start_time -c copy -t $duration $output_dir/$output_file_name.mp4"
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
    
    if [[ "$no_encode" == true ]]; then
      ffmpeg_command="`get_ffmpeg_cut_command_without_encoding $input_file $duration $output_dir $name`"
    else
      ffmpeg_command="`get_ffmpeg_cut_command_with_encoding $input_file $duration $codec $dimensions $tune $preset $crop $queue_size $crf $output_dir $name`"
    fi
  
    save_ffmpeg_command "$ffmpeg_command"
  done
}




create_concat_file() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local files_to_join="$1"
  local output_dir="$2"
  local concat_file_location="$3"

  [[ "$files_to_join" == "" || -z "$output_dir" || -z "$concat_file_location" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"
  
  touch "$concat_file_location"

  > "$concat_file_location"

  IFS=','
  read -ra files <<< "$files_to_join"
  for file in "${files[@]}"; do
    [[ ! -f "$file" ]] && error_file_not_found "$file" "${FUNCNAME[0]}"
    echo "file '$(pwd)/$file'" >> $concat_file_location
  done
}

get_ffmpeg_join_command() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local concat_file_location="$1"
  local output_dir="$2"
  local output_name="$3"

  [[ -z "$concat_file_location" || -z "$output_dir" || -z "$output_name" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  echo "ffmpeg -f concat -safe 0 -i $concat_file_location -c copy $output_dir/$output_name.mp4"
}

run_ffmpeg_command() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local ffmpeg_command="$1"
  
  [[ -z "$ffmpeg_command" ]] && error_missing_function_args "${FUNCNAME[0]}"

  eval "$ffmpeg_command"
}

join_mode() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local files_to_join="$1"
  local output_dir="$2"
  local output_name="$3"
  
  [[ "$files_to_join" == "" || -z "$output_dir" || -z "$output_name" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  local concat_file_location="$output_dir/`default_concat_file_name`"

  create_concat_file "$files_to_join" "$output_dir" "$concat_file_location"
  local ffmpeg_command=`get_ffmpeg_join_command "$concat_file_location" "$output_dir" "$output_name"`
  run_ffmpeg_command "$ffmpeg_command"
}




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

  [[ -z "$ffplay_command" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  eval "$ffplay_command"
}

watch_mode() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local video_device="$1"
  local audio_device="$2"

  [[ -z "$video_device" || -z "$audio_device" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"

  run_ffplay_command `get_ffplay_command "$video_device" "$audio_device"`
}




run_capture_mode() {
  capture_mode `read_capture_args "$@"`
}

run_cut_mode() {
  cut_mode `read_cut_args "$@"`
}

run_batch_mode() {
  batch_mode `read_batch_args "$@"`
}

run_join_mode() {
  join_mode `read_join_args "$@"`
}

run_watch_mode() {
  watch_mode `read_watch_args "$@"`
}

create_config_dir() {
  mkdir -p `config_dir`
}

main() {
  local is_verbose=`read_verbose_args "$@"`
  [[ "$is_verbose" == true ]] && VERBOSE=true
  
  create_config_dir

  local mode=`read_mode_args "$@"`
  read_help_args "$@"
  if [[ "$mode" == `capture_mode_name` ]]; then
    run_capture_mode "$@"
  elif [[ "$mode" == `cut_mode_name` ]]; then
    run_cut_mode "$@"
  elif [[ "$mode" == `batch_mode_name` ]]; then
    run_batch_mode "$@"
  elif [[ "$mode" == `join_mode_name` ]]; then
    run_join_mode "$@"
  elif [[ "$mode" == `watch_mode_name` ]]; then
    run_watch_mode "$@"
  else
    `print_help_by_mode`
  fi
}

main "$@"

