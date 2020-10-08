#!/bin/bash

#----------------
# Name          : defaults.bash
# Description   : Library of functions to return default values
#----------------

source $(dirname $0)/utilities/time.bash

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

