#!/bin/bash

#----------------
# Name          : capture_video_args_tests.bash
# Description   : Unit test capture-video-mode functionality
#----------------

source ./_src/utils/constants.bash
source ./_src/utils/fs.bash
source ./_src/args/capture_args.bash

test_reading_capture_args_with_no_args() {
  local message="Result should contain all default arguments."
  local message="It should return all default arguments"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_video_device_short_arg() {
  local message="Result should contain the configured video_device."
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "" ; }
  get_audio_device_selection() { echo "test_audio_device" ; }
  local expected_result="$test_video_device `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args -i "$test_video_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_video_device_first_long_arg() {
  local message="Result should contain the configured video_device."
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "" ; }
  get_audio_device_selection() { echo "test_audio_device" ; }
  local expected_result="$test_video_device `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file_location`"

  local result=`read_capture_args --input "$test_video_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_video_device_second_long_arg() {
  local message="Result should contain the configured video_device."
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_video_device `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args --video_device "$test_video_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_audio_device_short_arg() {
  local message="Result should contain the configured audio_device."
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "" ; }
  local audio_device="hw:9,9"
  local expected_result="$test_video_device $test_audio_device `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args -a "$test_audio_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_audio_device_long_arg() {
  local message="Result should contain the configured audio_device."
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "" ; }
  local audio_device="hw:9,9"
  local expected_result="$test_video_device $test_audio_device `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args --audio_device "$test_audio_device"`
  
  assertEquals "$message" "$expected_result" "$result"
  
}

test_reading_capture_args_codec_short_arg() {
  local message="Result should contain the configured codec."
  local codec="test_codec"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` $codec `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args -c "$codec"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_codec_long_arg() {
  local message="Result should contain the configured codec."
  local codec="test_codec"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` $codec `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args --codec "$codec"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_output_directory_short_arg() {
  local message="Result should contain the configured output_dir."
  local output_dir="TestDirectory"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` $output_dir/`time_now`.mp4"
  
  local result=`read_capture_args -d "$output_dir"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_output_directory_long_arg() {
  local message="Result should contain the configured output_dir."
  local output_dir="TestDirectory"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` $output_dir/`time_now`.mp4"
  
  local result=`read_capture_args --output_dir "$output_dir"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_stop_time_short_arg() {
  local message="Result should contain the configured stop_time."
  local stop_time="99:99:99.999"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` $stop_time `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args -t "$stop_time"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_stop_time_long_arg() {
  local message="Result should contain the configured stop_time."
  local stop_time="99:99:99.999"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` $stop_time `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args --stop_time "$stop_time"`
  
  assertEquals "$message" "$expected_result" "$result"
}


test_reading_capture_args_output_name_short_arg() {
  local message="Result should contain the configured output_name."
  local output_name="MyOutput"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_dir`/$output_name.mp4"
  
  local result=`read_capture_args -o "$output_name"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_output_name_long_arg() {
  local message="Result should contain the configured output_name."
  local output_name="MyOutput"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_dir`/$output_name.mp4"
  
  local result=`read_capture_args --output_name "$output_name"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_video_format_long_arg() {
  local message="Result should contain the configured video_format."
  local video_format="test_format"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` $video_format `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args --video_format "$video_format"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_audio_format_long_arg() {
  local message="Result should contain the configured audio_format."
  local audio_format="test_format"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` $audio_format `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args --audio_format "$audio_format"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_crf_long_arg() {
  local message="Result should contain the configured crf."
  local crf="99"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` $crf `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args --crf "$crf"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_preset_long_arg() {
  local message="Result should contain the configured preset."
  local preset="test_preset"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` $preset `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args --preset "$preset"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_size_long_arg() {
  local message="Result should contain the configured size."
  local size="999x999"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` $size `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args --size "$size"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_standard_long_arg() {
  local message="Result should contain the configured standard."
  local standard="test_standard"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` $standard `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args --standard "$standard"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_threads_long_arg() {
  local message="Result should contain the configured threads."
  local threads="999"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` $threads `default_tune` `default_format` `default_output_file_location`"
  
  local result=`read_capture_args --threads "$threads"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_tune_long_arg() {
  local message="Result should contain the configured tune."
  local tune="test_tune"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_capture_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` $tune `default_format` `default_output_file_location`"
  
  local result=`read_capture_args --tune "$tune"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_capture_args_all_args() {
  local message="Result should contain all configured args."
  local test_video_device="/dev/video0"
  local test_audio_device="hw:9,9"
  local codec="test_codec"
  local output_dir="TestDir"
  local output_name="TestFile"
  local stop_time="99:99:99.999"
  local video_format="test_vid_format"
  local audio_format="test_aud_format"
  local crf="99"
  local preset="fast"
  local size="999x999"
  local standard="test_standard"
  local threads="999"
  local tune="test_tune"
  local test_video_device="/dev/video9"
  local test_audio_device="hw:9,9"
  time_now() { echo "200909185525" ; }
  get_video_device_selection() { echo "$test_video_device" ; }
  get_audio_device_selection() { echo "$test_audio_device" ; }
  local expected_result="$test_video_device $test_audio_device $codec $crf $video_format $audio_format $preset $size $standard $stop_time $threads $tune `default_format` $output_dir/$output_name.mp4"
  
  local result=`read_capture_args -i "$test_video_device" -a "$test_audio_device" -c "$codec" -d "$output_dir" -t "$stop_time" -o "$output_name" --video_format "$video_format" --audio_format "$audio_format" --crf "$crf" --preset "$preset" --size "$size" --standard "$standard" --threads "$threads" --tune "$tune"`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2
 
