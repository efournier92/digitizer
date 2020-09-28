#!/bin/bash

#----------------
# Name          : video_defaults
# Description   : Returns contstants
#----------------

get_video_size() {
  echo "640x480"
}

get_default_start_time() {
  echo "00:00:00"
}

get_default_end_time() {
  echo "06:00:00"
}

get_default_output_dir() {
  echo "./+OUT"
}

get_video_output_dir() {
  echo "/mnt/bnk/hle/VHS"
}

get_pending_commands_file() {
  echo "/home/misigno/Desktop/vshd_pending_commands.txt"
}

get_default_size() {
  echo "720x540"
}

get_default_crf() {
  echo "28"
}

get_default_preset() {
  echo "slow"
}

get_default_yadif() {
  echo ""
}

get_default_dimensions() {
  echo "720x540"
}

get_default_crop() {
  local crop=in_w-2*20:in_h-2*20

  echo "$crop"
}

get_default_video_codec() {
  echo "libx264"
}

get_default_tuning() {
  echo "film"
}

get_default_max_queue() {
  echo "400"
}

get_input_video_format() {
  echo "v4l2"
}

get_input_audio_format() {
  echo "alsa"
}

get_output_video_codec() {
  echo "libx264"
}

get_output_format() {
  echo "mpeg"
}

get_output_extension() {
  echo "mp4"
}

get_output_tuning() {
  echo "zerolatency"
}

get_output_crf() {
  echo "16"
}

get_output_max_threads() {
  echo "512"
}

get_output_speed_preset() {
  echo "fast"
}

