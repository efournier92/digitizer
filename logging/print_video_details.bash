source ../utilities/fs.bash

## Print debugging info
print_debugging_info() {
  local input_video_device="${1}"
  local input_audio_device="${2}"
  local output_file_name="${3}"
  local output_duration="${4}"
  local output_video_size="${5}"

  local sb=""
  sb="${sb}-------------------------\n"
  sb="${sb}Video Input Device      : ${input_video_device}\n"
  sb="${sb}Audio Input Device      : ${input_audio_device}\n"
  sb="${sb}Output File Name        : ${output_file_name}\n"
  sb="${sb}Output Maximum Duration : ${output_duration}\n"
  sb="${sb}Output Video Dimensions : ${output_video_size}\n"
  sb="${sb}Output Video Dimensions : ${output_video_size}\n"
  sb="${sb}Output Video To         : `get_output_file`\n"
  sb="${sb}-------------------------"
  
  echo "${sb}"
}

