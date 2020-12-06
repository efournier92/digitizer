#!/bin/bash

#----------------
# Name          : fs.bash
# Description   : Library for functions for file-system-related activities
#----------------

source "./_src/utils/time.bash"

default_output_dir() {
  echo "$(pwd)"
}

default_video_file_name() {
  echo "`time_now`.mp4"
}

default_video_file_location() {
  echo "`default_output_dir`/`default_video_file_name`"
}

default_audio_file_name() {
  echo "`time_now`.wav"
}

default_audio_file_location() {
  echo "`default_output_dir`/`default_audio_file_name`"
}

config_dir() {
  echo "$HOME/.digitizer"
}

concat_file_name() {
  echo "_temp_concat.txt"
}

concat_file_location() {
  echo "`config_dir`/`concat_file_name`"
}

batch_file_name() {
  echo "digitizer_batch.txt"
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

