#!/bin/bash

#----------------
# Name          : defaults.bash
# Project       : digitizer
# Description   : Library of functions to return default values
#----------------

source "./_src/utils/time.bash"

capture_video_mode_name() {
  echo "capture_video"
}

capture_audio_mode_name() {
  echo "capture_audio"
}

cut_video_mode_name() {
  echo "cut_video"
}

cut_audio_mode_name() {
  echo "cut_audio"
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

default_video_input_dimensions() {
  echo "640x480"
}

default_video_output_dimensions() {
  echo "720x540"
}

default_video_input_format() {
  echo "v4l2"
}

default_audio_input_format() {
  echo "alsa"
}

default_start_time() {
  echo "00:00:00.000"
}

default_video_stop_time() {
  echo "06:00:00.000"
}

default_audio_stop_time() {
  echo "01:00:00.000"
}

default_crf() { 
  echo "28"
}

default_capture_preset() {
  echo "ultrafast"
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

default_num_audio_channels() {
  echo "1"
}

default_standard() {
  echo "ntsc"
}

default_format() {
  echo "mpeg"
}

default_max_threads() {
  echo "512"
}

default_max_queue() {
  echo "400"
}

default_audio_output_format() {
  echo "wav"
}

default_audio_sample_rate() {
  echo "44100"
}

