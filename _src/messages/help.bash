#!/bin/bash

#----------------
# Name          : help.bash
# Project       : digitizer
# Description   : Library of functions for printing help info
#----------------

help_header() {
cat << EOF
_________
DIGITIZER : Digitization Suite

EOF
}

help_batch() {
cat << EOF
_____
BATCH

  -i, --input,         
  --batch_file         batch text file created from cut mode
  
  USAGE: digitizer -m batch -i ~/.digitizer/batch.txt

EOF
}

help_capture_video() {
cat << EOF
_____________
CAPTURE VIDEO

  -i, --input,         input video devide
  --video_device

  -a, --audio_device   input audio device

  -c, --codec          output video codec

  -t, --stop_time      maximum capture duration

  -d, --output_dir     directory in which to save the capture

  -o, --output_name    name for the capture file

  --video_format       output video format []

  --audio_format       output audio format []

  --crf                output constant rate factor

  --preset             preset for capture process []

  --size               input video size

  --standard           input stream standard [ntsc,pal,...]

  --threads            maximum threads for process

  --tune               tuning for capture output [film,...]

  USAGE: digitizer -m capture -i /dev/video0 -a hw:2,0 -d . -o captured.bash

EOF
}

help_capture_audio() {
cat << EOF
_____________
CAPTURE AUDIO

EOF
}

help_cut_video() {
cat << EOF
_________
CUT VIDEO

  -i, --input_file     input video for cutting

  -d, --output_dir     directory in which to save the cut file

  --crf                constant rate factor for encoding cut file

  --crop               crop to apply in cut file

  --dimensions         dimensions of the output cut file

  --preset             preset for the encoding process

  --queue_size         max queue size for encoding process

  --tune               video tuning for the output file [film,...]
  
  USAGE: digitizer -m cut_video -i file.mp4 -d (pwd)/_OUT

EOF
}

help_general() {
cat << EOF
_______
GENERAL

  -h, --help [mode]    print help information [for mode]

  -m, --mode           enable mode [capture|cut|batch|join]

  -v, --verbose        enable verbose debugging info
  
EOF
}

help_join() {
cat << EOF
____
JOIN

  -i, --input,         batch text file created in cut mode


  -d, --output_dir     directory in which to save the joined file

  -o, --output_name    name for the joined file

  USAGE: digitizer -m join -i file.mp4 -d . -o out_file.mp4

EOF
}

help_watch() {
cat << EOF
_____
WATCH

  -i, --input,         input video devide
  --video_device

  USAGE: digitizer -m watch -i /dev/video0

EOF
}

print_help_capture_video() {
  help_header
  help_capture_video
}

print_help_capture_audio() {
  help_header
  help_capture_audio
}

print_help_cut_video() {
  help_header
  help_cut_video
}

print_help_general() {
  help_header
  help_general
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
  help_capture_video
  help_capture_audio
  help_cut_video
  help_general
  help_batch
  help_join
  help_watch
}

print_help_by_mode() {
  local mode="$1"
  
  if [[ "$mode" == `batch_mode_name` ]]; then
    print_help_batch
  elif [[ "$mode" == `capture_video_mode_name` ]]; then
    print_help_capture_video
  elif [[ "$mode" == `capture_audio_mode_name` ]]; then
    print_help_capture_audio
  elif [[ "$mode" == `cut_video_mode_name` ]]; then
    print_help_cut_video
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

