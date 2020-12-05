#!/bin/bash

#----------------
# Name          : fs.bash
# Description   : Library for functions for file-system-related activities
#----------------

source "./_src/utils/time.bash"

default_output_dir() {
  echo "$(pwd)"
}

default_output_file_name() {
  echo "`time_now`.mp4"
}

default_output_audio_capture_file_name() {
  echo "`time_now`.wav"
}

default_output_file_location() {
  echo "`default_output_dir`/`default_output_file_name`"
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
  echo "vhsd_batch.txt"
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

