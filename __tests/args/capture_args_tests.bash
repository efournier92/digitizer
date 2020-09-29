#!/bin/bash

#----------------
# Name          : capture_args_tests
# Description   : Unit test capture-mode functionality
#----------------

source ./constants/defaults.bash
source ./args/capture_args.bash

# Mocks
get_video_device_selection() { echo "/dev/video0" ; }

get_audio_device_selection() { echo "hw:2,0" ; }

time_now() { echo "200909185525" ; }

test_reading_with_no_args() {
  local message="It should set all default arguments"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_video_device_short_arg() {
  local message="It should set configured video_device"
  local video_device="/dev/video9"
  local expected_result="$video_device `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args -i "$video_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_video_device_first_long_arg() {
  local message="It should set configured video_device"
  local video_device="/dev/video9"
  local expected_result="$video_device `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args --input "$video_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_video_device_second_long_arg() {
  local message="It should set configured video_device"
  local video_device="/dev/video9"
  local expected_result="$video_device `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args --video_device "$video_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_audio_device_short_arg() {
  local message="It should set configured audio_device"
  local audio_device="hw:9,9"
  local expected_result="`get_video_device_selection` $audio_device `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args -a "$audio_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_audio_device_long_arg() {
  local message="It should set configured audio_device"
  local audio_device="hw:9,9"
  local expected_result="`get_video_device_selection` $audio_device `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args --audio_device "$audio_device"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_codec_short_arg() {
  local message="It should set configured codec"
  local codec="test_codec"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` $codec `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args -c "$codec"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_codec_long_arg() {
  local message="It should set configured codec"
  local codec="test_codec"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` $codec `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args --codec "$codec"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_output_directory_short_arg() {
  local message="It should set configured output_directory"
  local output_directory="TestDirectory"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` $output_directory/`time_now`.mp4"
  
  local result=`read_capture_args -d "$output_directory"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_output_directory_long_arg() {
  local message="It should set configured output_directory"
  local output_directory="TestDirectory"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` $output_directory/`time_now`.mp4"
  
  local result=`read_capture_args --output_directory "$output_directory"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_stop_time_short_arg() {
  local message="It should set configured stop_time"
  local stop_time="99:99:99.999"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` $stop_time `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args -t "$stop_time"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_stop_time_long_arg() {
  local message="It should set configured stop_time"
  local stop_time="99:99:99.999"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` $stop_time `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args --stop_time "$stop_time"`
  
  assertEquals "$message" "$expected_result" "$result"
}


test_reading_output_name_short_arg() {
  local message="It should set configured output_name"
  local output_name="MyOutput"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_directory`/$output_name.mp4"
  
  local result=`read_capture_args -o "$output_name"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_output_name_long_arg() {
  local message="It should set configured output_name"
  local output_name="MyOutput"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_directory`/$output_name.mp4"
  
  local result=`read_capture_args --output_name "$output_name"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_video_format_long_arg() {
  local message="It should set configured video_format"
  local video_format="test_format"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` $video_format `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args --video_format "$video_format"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_audio_format_long_arg() {
  local message="It should set configured audio_format"
  local audio_format="test_format"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` $audio_format `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args --audio_format "$audio_format"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_crf_long_arg() {
  local message="It should set configured crf"
  local crf="99"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` $crf `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args --crf "$crf"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_preset_long_arg() {
  local message="It should set configured preset"
  local preset="test_preset"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` $preset `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args --preset "$preset"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_size_long_arg() {
  local message="It should set configured size"
  local size="999x999"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` $size `default_standard` `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args --size "$size"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_standard_long_arg() {
  local message="It should set configured standard"
  local standard="test_standard"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` $standard `default_stop_time` `default_max_threads` `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args --standard "$standard"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_threads_long_arg() {
  local message="It should set configured threads"
  local threads="999"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` $threads `default_tune` `default_format` `default_output_file`"
  
  local result=`read_capture_args --threads "$threads"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_tune_long_arg() {
  local message="It should set configured tune"
  local tune="test_tune"
  local expected_result="`get_video_device_selection` `get_audio_device_selection` `default_video_codec` `default_crf` `default_input_video_format` `default_input_audio_format` `default_preset` `default_input_video_size` `default_standard` `default_stop_time` `default_max_threads` $tune `default_format` `default_output_file`"
  
  local result=`read_capture_args --tune "$tune"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_all_args() {
  local message="It should set all configured args"
  local video_device="/dev/video0"
  local audio_device="hw:9,9"
  local codec="test_codec"
  local output_directory="TestDir"
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
  local expected_result="$video_device $audio_device $codec $crf $video_format $audio_format $preset $size $standard $stop_time $threads $tune `default_format` $output_directory/$output_name.mp4"
  
  local result=`read_capture_args -i "$video_device" -a "$audio_device" -c "$codec" -d "$output_directory" -t "$stop_time" -o "$output_name" --video_format "$video_format" --audio_format "$audio_format" --crf "$crf" --preset "$preset" --size "$size" --standard "$standard" --threads "$threads" --tune "$tune"`
  
  assertEquals "$message" "$expected_result" "$result"
}
 
suite_addTest test_reading_with_no_args
suite_addTest test_reading_video_device_short_arg
suite_addTest test_reading_video_device_first_long_arg
suite_addTest test_reading_video_device_second_long_arg
suite_addTest test_reading_audio_device_short_arg
suite_addTest test_reading_audio_device_long_arg
suite_addTest test_reading_codec_short_arg
suite_addTest test_reading_codec_long_arg
suite_addTest test_reading_output_directory_short_arg
suite_addTest test_reading_output_directory_long_arg
suite_addTest test_reading_stop_time_short_arg
suite_addTest test_reading_stop_time_long_arg
suite_addTest test_reading_output_name_short_arg
suite_addTest test_reading_output_name_long_arg
suite_addTest test_reading_video_format_long_arg
suite_addTest test_reading_audio_device_short_arg
suite_addTest test_reading_crf_long_arg
suite_addTest test_reading_preset_long_arg
suite_addTest test_reading_size_long_arg
suite_addTest test_reading_standard_long_arg
suite_addTest test_reading_threads_long_arg
suite_addTest test_reading_tune_long_arg
suite_addTest test_reading_all_args
