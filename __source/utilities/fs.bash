#!/bin/bash

#----------------
# Name          : fs.bash
# Description   : Library for functions for file-system-related activities
#----------------

source $(dirname $0)/utilities/time.bash

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

