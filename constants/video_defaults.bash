#!/bin/bash

video_size() {
  echo "640x480"
}

get_default_start_time() {
  echo "00:00:00"
}

get_default_end_time() {
  echo "06:00:00"
}

get_default_output_dir() {
  echo "./"
}

get_default_size() {
  echo "720:540"
}

get_default_crf() {
  echo "28"
}

get_default_preset() {
  echo "slow"
}

get_default_crop() {
  echo "20:20:20:20"
}

get_default_video_codec() {
  echo "libx264"
}

input_video_format() {
  echo "v4l2"
}

input_audio_format() {
  echo "alsa"
}

output_video_codec() {
  echo "libx264"
}

output_format() {
  echo "mpeg"
}

output_extension() {
  echo "mp4"
}

output_tuning() {
  echo "zerolatency"
}

output_crf() {
  echo "16"
}

output_max_threads() {
  echo "512"
}

output_speed_preset() {
  echo "fast"
}

