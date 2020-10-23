#!/bin/bash

#----------------
# Name          : run_build.bash
# Description   : Runs the build process for vhsd, outputting a compiled binary to the build directory.
# Author        : E Fournier
# Dependencies  : shc
# Example Usage : bash run_build.bash
#----------------

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
    _src/messages/logs.bash \
    _src/messages/errors.bash \
    _src/messages/help.bash \
    _src/utilities/devices.bash \
    _src/utilities/fs.bash \
    _src/utilities/time.bash \
    _src/utilities/modes.bash \
    _src/constants/defaults.bash \
    _src/input/selection/select_device.bash \
    _src/args/batch_args.bash \
    _src/args/capture_args.bash \
    _src/args/cut_args.bash \
    _src/args/help_args.bash \
    _src/args/join_args.bash \
    _src/args/mode_args.bash \
    _src/args/verbose_args.bash \
    _src/args/watch_args.bash \
    _src/args/audio_args.bash \
    _src/modes/batch_mode.bash \
    _src/modes/capture_mode.bash \
    _src/modes/cut_mode.bash \
    _src/modes/join_mode.bash \
    _src/modes/watch_mode.bash \
    _src/modes/audio_mode.bash \
    _src/main.bash \
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
  printf "\nCompiled binary to `get_binary_file_location $output_name`\n"
}

main "$@"

