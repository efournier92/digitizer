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

print_help_all() {
  help_header
  help_general
  help_capture
  help_cut
  help_batch
  help_join
}

print_help_menu() {
  local mode="$1"
  
  if [[ "$mode" == `capture_mode_name` ]]; then
    print_help_capture
  elif [[ "$mode" == `cut_mode_name` ]]; then
    print_help_cut
  elif [[ "$mode" == `batch_mode_name` ]]; then
    print_help_batch
  elif [[ "$mode" == `join_mode_name` ]]; then
    print_help_join
  else
    print_help_all
  fi
}

show_help() {
  local mode="$1"
  
  echo `print_help_menu "$mode"`

  exit
}

