#!/bin/bash

#----------------
# Name          : cut_args_tests.bash
# Description   : Unit test cut-mode functionality
#----------------

source ./__source/args/cut_args.bash
source ./__source/constants/defaults.bash
source ./__source/messages/errors.bash

test_reading_cut_args_with_no_args() {
  local message="It should throw a missing-required-args error for input_file"
  local expected_result=`error_missing_required_arg "input_file" "read_cut_args"`
  
  local result=`read_cut_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_args_with_input_short_arg() {
  local message="Return should include the configured value for input_file"
  local input_file="TestFile.mp4"
  local expected_result="$input_file `default_video_codec` `default_dimensions` `default_tune` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_args -i "$input_file"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_args_with_input_long_arg() {
  local message="Return should include the configured value for input_file"
  local input_file="TestFile"
  local expected_result="$input_file `default_video_codec` `default_dimensions` `default_tune` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_args --input_file "$input_file"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_args_with_codec_short_arg() {
  local message="Return should include the configured value for codec"
  local input_file="TestFile.mp4"
  local codec="test_codec"
  local expected_result="$input_file $codec `default_dimensions` `default_tune` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_args -i "$input_file" -c "$codec"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_args_with_codec_long_arg() {
  local message="Return should include the configured value for codec"
  local input_file="TestFile.mp4"
  local codec="test_codec"
  local expected_result="$input_file $codec `default_dimensions` `default_tune` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_args -i "$input_file" -c "$codec"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_args_with_output_dir_short_arg() {
  local message="Return should include the configured value for output_dir"
  local input_file="TestFile.mp4"
  local output_dir="OutDir"
  local expected_result="$input_file `default_video_codec` `default_dimensions` `default_tune` `default_preset` `default_crop` `default_max_queue` `default_crf` $output_dir"
  
  local result=`read_cut_args -i "$input_file" -d "$output_dir"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_args_with_output_dir_long_arg() {
  local message="Return should include the configured value for output_dir"
  local input_file="TestFile.mp4"
  local output_dir="OutDir"
  local expected_result="$input_file `default_video_codec` `default_dimensions` `default_tune` `default_preset` `default_crop` `default_max_queue` `default_crf` $output_dir"
  
  local result=`read_cut_args -i "$input_file" --output_dir "$output_dir"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_args_with_crf_long_arg() {
  local message="Return should include the configured value for crf"
  local input_file="TestFile.mp4"
  local crf="test_crf"
  local expected_result="$input_file `default_video_codec` `default_dimensions` `default_tune` `default_preset` `default_crop` `default_max_queue` "$crf" `default_output_dir`"
  
  local result=`read_cut_args -i "$input_file" --crf "$crf"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_args_with_crop_long_arg() {
  local message="Return should include the configured value for crop"
  local input_file="TestFile.mp4"
  local crop="test_crop"
  local expected_result="$input_file `default_video_codec` `default_dimensions` `default_tune` `default_preset` "$crop" `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_args -i "$input_file" --crop "$crop"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_args_with_dimensions_long_arg() {
  local message="Return should include the configured value for dimensions"
  local input_file="TestFile.mp4"
  local dimensions="test_dimensions"
  local expected_result="$input_file `default_video_codec` "$dimensions" `default_tune` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_args -i "$input_file" --dimensions "$dimensions"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_args_with_preset_long_arg() {
  local message="Return should include the configured value for preset"
  local input_file="TestFile.mp4"
  local preset="test_preset"
  local expected_result="$input_file `default_video_codec` `default_dimensions` `default_tune` "$preset" `default_crop` `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_args -i "$input_file" --preset "$preset"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_args_with_queue_size_long_arg() {
  local message="Return should include the configured value for max_queue"
  local input_file="TestFile.mp4"
  local max_queue="test_queue_size"
  local expected_result="$input_file `default_video_codec` `default_dimensions` `default_tune` `default_preset` `default_crop` "$max_queue" `default_crf` `default_output_dir`"
  
  local result=`read_cut_args -i "$input_file" --queue_size "$max_queue"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_args_with_tune_long_arg() {
  local message="Return should include the configured value for tune"
  local input_file="TestFile.mp4"
  local tune="test_tune"
  local expected_result="$input_file `default_video_codec` `default_dimensions` "$tune" `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_args -i "$input_file" --tune "$tune"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_args_with_all_short_args() {
  local message="Return should include all configured values"
  local input_file="TestFile.mp4"
  local codec="test_codec"
  local output_dir="TestOutDir"
  local expected_result="$input_file $codec `default_dimensions` `default_tune` `default_preset` `default_crop` `default_max_queue` `default_crf` $output_dir"
  
  local result=`read_cut_args -i "$input_file" -c "$codec" -d "$output_dir"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_args_with_all_long_args() {
  local message="Return should include all configured values"
  local input_file="TestFile.mp4"
  local codec="test_codec"
  local dimensions="test_dimensions"
  local tune="test_tune"
  local preset="test_preset"
  local crop="test_crop"
  local max_queue="test_max_queue"
  local crf="test_crf"
  local output_dir="TestOutDir"
  local expected_result="$input_file $codec $dimensions $tune $preset $crop $max_queue $crf $output_dir"
  
  local result=`read_cut_args --input_file "$input_file" --codec "$codec" --output_dir "$output_dir" --crf "$crf" --crop "$crop" --dimensions "$dimensions" --preset "$preset" --queue_size "$max_queue" --tune "$tune"`
  
  assertEquals "$message" "$expected_result" "$result"
}

suite_addTest test_reading_cut_args_with_no_args
suite_addTest test_reading_cut_args_with_input_short_arg
suite_addTest test_reading_cut_args_with_input_long_arg
suite_addTest test_reading_cut_args_with_codec_short_arg
suite_addTest test_reading_cut_args_with_codec_long_arg
suite_addTest test_reading_cut_args_with_output_dir_short_arg
suite_addTest test_reading_cut_args_with_output_dir_long_arg
suite_addTest test_reading_cut_args_with_crf_long_arg
suite_addTest test_reading_cut_args_with_crop_long_arg
suite_addTest test_reading_cut_args_with_dimensions_long_arg
suite_addTest test_reading_cut_args_with_preset_long_arg
suite_addTest test_reading_cut_args_with_queue_size_long_arg
suite_addTest test_reading_cut_args_with_tune_long_arg
suite_addTest test_reading_cut_args_with_all_short_args
suite_addTest test_reading_cut_args_with_all_long_args

