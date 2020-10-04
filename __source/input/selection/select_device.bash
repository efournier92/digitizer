#!/bin/bash

#----------------
# Name          : select_device.bash
# Description   : Library of functions to return default values
#----------------

source $(dirname $0)/__source/utilities/devices.bash

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

