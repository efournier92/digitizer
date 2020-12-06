#!/bin/bash

#----------------
# Name          : capture_audio_args_tests.bash
# Project       : digitizer
# Description   : Unit test capture-audio-mode functionality
#----------------

source "./_src/utils/constants.bash"
source "./_src/utils/fs.bash"
source "./_src/args/capture_audio_args.bash"

test_capture_audio_args_with_no_args() {
  local message="Result should contain all default audio arguments."
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_audio_device_selection` `default_audio_input_format` `default_audio_output_format` `default_number_of_audio_channels` `default_audio_sample_rate` `default_max_threads` `default_audio_stop_time` `default_audio_file_location`"
  
  local result=`read_capture_audio_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_audio_device_first_short_arg() {
  local message="Result should contain the configured audio device argument."
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_audio_device `default_audio_input_format` `default_audio_output_format` `default_number_of_audio_channels` `default_audio_sample_rate` `default_max_threads` `default_audio_stop_time` `default_audio_file_location`"
  
  local result=`read_capture_audio_args -i "$test_audio_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_audio_device_second_short_arg() {
  local message="Result should contain the configured audio device argument."
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_audio_device `default_audio_input_format` `default_audio_output_format` `default_number_of_audio_channels` `default_audio_sample_rate` `default_max_threads` `default_audio_stop_time` `default_audio_file_location`"
  
  local result=`read_capture_audio_args -a "$test_audio_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_audio_device_long_arg() {
  local message="Result should contain the configured audio device argument."
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_audio_device `default_audio_input_format` `default_audio_output_format` `default_number_of_audio_channels` `default_audio_sample_rate` `default_max_threads` `default_audio_stop_time` `default_audio_file_location`"
  
  local result=`read_capture_audio_args --audio_device "$test_audio_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_input_format_short_arg() {
  local message="Result should contain the configured input format argument."
  local test_audio_device="hw:9,9"
  local test_input_format="raw"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_audio_device_selection` $test_input_format `default_audio_output_format` `default_number_of_audio_channels` `default_audio_sample_rate` `default_max_threads` `default_audio_stop_time` `default_audio_file_location`"

  local result=`read_capture_audio_args -fi "$test_input_format"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_input_format_long_arg() {
  local message="Result should contain the configured input format argument."
  local test_audio_device="hw:9,9"
  local test_input_format="raw"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_audio_device_selection` $test_input_format `default_audio_output_format` `default_number_of_audio_channels` `default_audio_sample_rate` `default_max_threads` `default_audio_stop_time` `default_audio_file_location`"

  local result=`read_capture_audio_args --input_format "$test_input_format"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_output_format_short_arg() {
  local message="Result should contain the configured output format argument."
  local test_audio_device="hw:9,9"
  local test_output_format="flv"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_audio_device_selection` `default_audio_input_format` $test_output_format `default_number_of_audio_channels` `default_audio_sample_rate` `default_max_threads` `default_audio_stop_time` `default_audio_file_location`"

  local result=`read_capture_audio_args -fo "$test_output_format"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_output_format_long_arg() {
  local message="Result should contain the configured output format argument."
  local test_audio_device="hw:9,9"
  local test_output_format="flv"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_audio_device_selection` `default_audio_input_format` $test_output_format `default_number_of_audio_channels` `default_audio_sample_rate` `default_max_threads` `default_audio_stop_time` `default_audio_file_location`"

  local result=`read_capture_audio_args --output_format "$test_output_format"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_stop_time_short_arg() {
  local message="Result should contain the configured stop time."
  local test_audio_device="hw:9,9"
  local test_stop_time="99:99:99.999"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_audio_device_selection` `default_audio_input_format` `default_audio_output_format` `default_number_of_audio_channels` `default_audio_sample_rate` `default_max_threads` $test_stop_time `default_audio_file_location`"

  local result=`read_capture_audio_args -t "$test_stop_time"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_stop_time_long_arg() {
  local message="Result should contain the configured stop time."
  local test_audio_device="hw:9,9"
  local test_stop_time="99:99:99.999"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_audio_device_selection` `default_audio_input_format` `default_audio_output_format` `default_number_of_audio_channels` `default_audio_sample_rate` `default_max_threads` $test_stop_time `default_audio_file_location`"

  local result=`read_capture_audio_args --stop_time "$test_stop_time"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_channels_short_arg() {
  local message="Result should contain the configured number of channels."
  local test_audio_device="hw:9,9"
  local test_num_channels="8"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_audio_device_selection` `default_audio_input_format` `default_audio_output_format` $test_num_channels `default_audio_sample_rate` `default_max_threads` `default_audio_stop_time` `default_audio_file_location`"

  local result=`read_capture_audio_args -c "$test_num_channels"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_channels_long_arg() {
  local message="Result should contain the configured number of channels."
  local test_audio_device="hw:9,9"
  local test_num_channels="8"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_audio_device_selection` `default_audio_input_format` `default_audio_output_format` $test_num_channels `default_audio_sample_rate` `default_max_threads` `default_audio_stop_time` `default_audio_file_location`"

  local result=`read_capture_audio_args --num_channels "$test_num_channels"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_sample_rate_long_arg() {
  local message="Result should contain the configured sample rate."
  local test_audio_device="hw:9,9"
  local test_sample_rate="999"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_audio_device_selection` `default_audio_input_format` `default_audio_output_format` `default_number_of_audio_channels` $test_sample_rate `default_max_threads` `default_audio_stop_time` `default_audio_file_location`"
  local result=`read_capture_audio_args --sample_rate "$test_sample_rate"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_max_threads_long_arg() {
  local message="Result should contain the configured sample rate."
  local test_audio_device="hw:9,9"
  local test_max_threads="999"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_audio_device_selection` `default_audio_input_format` `default_audio_output_format` `default_number_of_audio_channels` `default_audio_sample_rate` $test_max_threads `default_audio_stop_time` `default_audio_file_location`"

  local result=`read_capture_audio_args --max_threads "$test_max_threads"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_output_dir_and_name_short_args() {
  local message="Result should contain the output location as configured."
  local test_audio_device="hw:9,9"
  local test_output_dir="/home/me/"
  local test_output_name="test"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_audio_device_selection` `default_audio_input_format` `default_audio_output_format` `default_number_of_audio_channels` `default_audio_sample_rate` `default_max_threads` `default_audio_stop_time` $test_output_dir/$test_output_name"

  local result=`read_capture_audio_args -d "$test_output_dir" -o "$test_output_name"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_output_dir_and_name_long_args() {
  local message="Result should contain the output location as configured."
  local test_audio_device="hw:9,9"
  local test_output_dir="/home/me/"
  local test_output_name="test"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_audio_device_selection` `default_audio_input_format` `default_audio_output_format` `default_number_of_audio_channels` `default_audio_sample_rate` `default_max_threads` `default_audio_stop_time` $test_output_dir/$test_output_name"

  local result=`read_capture_audio_args --output_dir "$test_output_dir" --output_name "$test_output_name"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_all_short_args() {
  local message="Result should contain the all configured arguments."
  local test_audio_device="hw:9,9"
  local test_input_format="raw"
  local test_output_format="flv"
  local test_num_channels="99"
  local test_sample_rate="999"
  local test_max_threads="888"
  local test_stop_time="99:99:99.999"
  local test_output_dir="/home/me/"
  local test_output_name="test"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_audio_device $test_input_format $test_output_format $test_num_channels $test_sample_rate $test_max_threads $test_stop_time $test_output_dir/$test_output_name"

  local result=`read_capture_audio_args -i "$test_audio_device" -fi "$test_input_format" -fo "$test_output_format" -t "$test_stop_time" -c "$test_num_channels" -d "$test_output_dir" -o "$test_output_name" --sample_rate "$test_sample_rate" --max_threads "$test_max_threads" `
  
  assertEquals "$message" "$expected_result" "$result"
}

test_capture_audio_args_with_all_short_args() {
  local message="Result should contain the all configured arguments."
  local test_audio_device="hw:9,9"
  local test_input_format="raw"
  local test_output_format="flv"
  local test_num_channels="99"
  local test_sample_rate="999"
  local test_max_threads="888"
  local test_stop_time="99:99:99.999"
  local test_output_dir="/home/me/"
  local test_output_name="test"
  time_now() { echo "200909185525" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_audio_device $test_input_format $test_output_format $test_num_channels $test_sample_rate $test_max_threads $test_stop_time $test_output_dir/$test_output_name"

  local result=`read_capture_audio_args --audio_device "$test_audio_device" --input_format "$test_input_format" --output_format "$test_output_format" --stop_time "$test_stop_time" --num_channels "$test_num_channels" --output_dir "$test_output_dir" --output_name "$test_output_name" --sample_rate "$test_sample_rate" --max_threads "$test_max_threads" `
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

