source ../utilities/devices.bash

get_user_selection() {
  list_options="${1}"
  prompt_header="${2}"
  
  echo prompt_header
  select selection in `${list_options}`; do
    echo "${selection}"
  done
} 

#### Video input device
get_video_device_selection() {
while [[ "${available_video_devices[@]}" =~ "${input_video_device}" ]]; do
  get_user_selection detect_video_devices "------\nSELECT VIDEO DEVICE\n------"
done
}

#### Audio input device
get_audio_device_selection() {
  while [[ "${available_audio_devices[@]}" =~ "$input_audio_device" ]]; do
    get_user_selection detect_audio_devices "------\nSELECT AUDIO DEVICE\n------"
  done
}

