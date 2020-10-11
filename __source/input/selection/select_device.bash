#!/bin/bash

#----------------
# Name          : select_device.bash
# Description   : Library of functions to return default values
#----------------

source $(dirname $0)/utilities/devices.bash

get_user_selection() {
  list_options="$1"
  prompt_header="$2"
 
  printf "$prompt_header" >&2
  select selection in $list_options; do
    echo "$selection"
    printf "\n" >&2
    break
  done
} 

get_video_device_selection() {
  local video_devices=`detect_video_devices`
  local header="\nVIDEO DEVICE\n"
  echo `get_user_selection "$video_devices" "$header"`
}

get_audio_device_selection() {
  local audio_devices=`detect_audio_devices`
  local header="AUDIO DEVICE\n"
  echo `get_user_selection "$audio_devices" "$header"`
}

