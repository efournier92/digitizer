#!/bin/bash

#----------------
# Name          : run_tests.bash
# Description   : Runs project test suite
# Author        : E Fournier
# Dependencies  : shunit2
# Example Usage : bash run_tests.bash
#----------------

print_header() {
  local file="$1"

  local filename=${file##*/}

cat << EOF
____
TEST $filename

EOF
}

run_test() {
  local file="$1"

  print_header "$file"

  eval "$file"
}

run_batch_args_tests() {
  local file="./_tests/args/batch_args_tests.bash"

  run_test "$file"
}

run_capture_video_args_tests() {
  local file="./_tests/args/capture_video_args_tests.bash"

  run_test "$file"
}

run_capture_audio_args_tests() {
  local file="./_tests/args/capture_audio_args_tests.bash"

  run_test "$file"
}

run_cut_args_tests() {
  local file="./_tests/args/cut_args_tests.bash"

  run_test "$file"
}

run_general_args_tests() {
  local file="./_tests/args/general_args_tests.bash"

  run_test "$file"
}

run_join_args_tests() {
  local file="./_tests/args/join_args_tests.bash"

  run_test "$file"
}

run_verbose_args_tests() {
  local file="./_tests/args/verbose_args_tests.bash"

  run_test "$file"
}

run_watch_mode_tests() {
  local file="./_tests/modes/watch_mode_tests.bash"

  run_test "$file"
}

run_constants_tests() {
  local file="./_tests/constants/defaults_tests.bash"

  run_test "$file"
}

run_devices_tests() {
  local file="./_tests/utils/devices_tests.bash"

  run_test "$file"
}

run_time_tests() {
  local file="./_tests/utils/time_tests.bash"

  run_test "$file"
}

run_modes_tests() {
  local file="./_tests/utils/modes_tests.bash"

  run_test "$file"
}

run_help_tests() {
  local file="./_tests/messages/help_tests.bash"

  run_test "$file"
}

run_batch_mode_tests() {
  local file="./_tests/modes/batch_mode_tests.bash"

  run_test "$file"
}

run_capture_mode_tests() {
  local file="./_tests/modes/capture_mode_tests.bash"

  run_test "$file"
}

run_cut_video_mode_tests() {
  local file="./_tests/modes/cut_video_mode_tests.bash"

  run_test "$file"
}

run_cut_audio_mode_tests() {
  local file="./_tests/modes/cut_audio_mode_tests.bash"

  run_test "$file"
}

run_join_mode_tests() {
  local file="./_tests/modes/join_mode_tests.bash"

  run_test "$file"
}

run_tests() {
  local file_to_test="$1"
  
  if [[ "$file_to_test" == "batch_args" ]]; then
    run_batch_args_tests
  elif [[ "$file_to_test" == "capture_video_args" ]]; then
    run_capture_video_args_tests
  elif [[ "$file_to_test" == "capture_audio_args" ]]; then
    run_capture_audio_args_tests
  elif [[ "$file_to_test" == "cut_args" ]]; then
    run_cut_args_tests
  elif [[ "$file_to_test" == "general_args" ]]; then
    run_general_args_tests
  elif [[ "$file_to_test" == "join_args" ]]; then
    run_join_args_tests
  elif [[ "$file_to_test" == "verbose_args" ]]; then
    run_verbose_args_tests
  elif [[ "$file_to_test" == "batch_mode" ]]; then
    run_batch_mode_tests
  elif [[ "$file_to_test" == "capture_video_mode" ]]; then
    run_capture_video_mode_tests
  elif [[ "$file_to_test" == "capture_audio_mode" ]]; then
    run_capture_audio_mode_tests
  elif [[ "$file_to_test" == "cut_video_mode" ]]; then
    run_cut_video_mode_tests
  elif [[ "$file_to_test" == "cut_audio_mode" ]]; then
    run_cut_audio_mode_tests
  elif [[ "$file_to_test" == "join_mode" ]]; then
    run_join_mode_tests
  elif [[ "$file_to_test" == "watch_mode" ]]; then
    run_watch_mode_tests
  elif [[ "$file_to_test" == "constants" ]]; then
    run_constants_tests
  elif [[ "$file_to_test" == "devices" ]]; then
    run_devices_tests
  elif [[ "$file_to_test" == "time" ]]; then
    run_time_tests
  elif [[ "$file_to_test" == "modes" ]]; then
    run_modes_tests
  elif [[ "$file_to_test" == "help" ]]; then
    run_help_tests
  else
    run_batch_args_tests
    run_capture_args_tests
    run_cut_args_tests
    run_general_args_tests
    run_join_args_tests
    run_verbose_args_tests
    run_watch_mode_tests
    run_constants_tests
    run_devices_tests
    run_time_tests
    run_modes_tests
    run_help_tests
    run_batch_mode_tests
    run_capture_mode_tests
    run_cut_video_mode_tests
    run_cut_audio_mode_tests
    run_join_mode_tests
  fi
}

run_tests "$@"

