#!/bin/bash

make_build_dir() {
  mkdir -p `get_output_dir`
}

get_output_dir() {
  local base_dir="."
  local dir_name="build"

  echo "${base_dir}/${dir_name}"
}

get_file_name() {
  local time_now=`date +"%y%m%d_%H%M"`

  echo "vhsd_${time_now}"
}

get_concat_file_location() {
  local output_name="$1"

  echo "`get_output_dir`/${output_name}_concat.bash"
}

get_binary_file_location() {
  local output_name="$1"

  echo "`get_output_dir`/${output_name}"
}

get_binary_temp_file_location() {
  local output_name="$1"

  echo "`get_concat_file_location ${output_name}`.x.c"
}

delete_concat_file() {
  local output_name="$1"
  
  rm `get_concat_file_location "$output_name"`
}

delete_binary_temp_file() {
  local output_name="$1"

  rm `get_binary_temp_file_location "$output_name"`
}

cleanup_temp_files() {
  local output_name="$1"

  delete_concat_file "$output_name"
  delete_binary_temp_file "$output_name"
}

create_binary() {
  local output_name="$1" 
  local concat_file_location=`get_concat_file_location "$output_name"`
  local binary_location=`get_binary_file_location "$output_name"`

  ./bin/shc -f "$concat_file_location" -o "$binary_location"
}

remove_line() {
  local output_name="$1"
  local line_number="$2"

  local file=`get_concat_file_location "$output_name"`

  sed -i "${line_number}d" $file
}

delete_comments() {
  local output_name="$1" 

  sed -i '/^\s*#/d' `get_concat_file_location $output_name`
}

delete_sources() {
  local output_name="$1" 

  sed -i '/^\s*source/d' `get_concat_file_location $output_name`
}

add_shebang() {
  local output_name="$1" 

  sed -i '1s;^;#!/bin/bash\n\n;' `get_concat_file_location $output_name`
}

concatenate_files() {
  local output_name="$1"

  cat \
    utilities/devices.bash \
    utilities/fs.bash \
    utilities/time.bash \
    constants/video_defaults.bash \
    ffmpeg/capture_video.bash \
    ffmpeg/convert_capture.bash \
    input/arguments/read_command_arguments.bash \
    input/arguments/read_convert_mode_arguments.bash \
    input/selection/select_device.bash \
    cut/cut_segments.bash \
    logging/print_video_details.bash \
    main.bash \
      >> `get_concat_file_location "$output_name"`
}

main() {
  local output_name=`get_file_name`
  
  make_build_dir
  concatenate_files  "$output_name"
  delete_comments    "$output_name"
  delete_sources     "$output_name"
  add_shebang        "$output_name"
  create_binary      "$output_name"  
  cleanup_temp_files "$output_name"
  echo "Compiled binary to `get_binary_file_location $output_name`"
}

main "$@"

