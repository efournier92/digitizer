#!/bin/bash

#----------------
# Name          : cut_video_args_tests.bash
# Project       : digitizer
# Description   : Unit test cut-mode functionality
#----------------

source "./_src/args/cut_video_args.bash"
source "./_src/utils/constants.bash"
source "./_src/utils/fs.bash"
source "./_src/messages/errors.bash"

test_reading_cut_video_args_with_no_args() {
  local message="It should throw a missing-required-args error with the name of the input file."
  local expected_result=`error_missing_required_arg "input_file" "read_cut_video_args"`
  
  local result=`read_cut_video_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_video_args_with_input_short_arg() {
  local message="Return should include the configured value of the input file."
  local input_file="TestFile.mp4"
  local expected_result="$input_file `default_video_codec` `default_video_output_dimensions` `default_tune` `default_num_audio_channels` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_video_args -i "$input_file"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_video_args_with_input_long_arg() {
  local message="Return should include the configured value for the input file."
  local input_file="TestFile"
  local expected_result="$input_file `default_video_codec` `default_video_output_dimensions` `default_tune` `default_num_audio_channels` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_video_args --input_file "$input_file"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_video_args_with_codec_short_arg() {
  local message="Return should include the configured value for the codec."
  local input_file="TestFile.mp4"
  local codec="test_codec"
  local expected_result="$input_file $codec `default_video_output_dimensions` `default_tune` `default_num_audio_channels` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_video_args -i "$input_file" -c "$codec"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_video_args_with_codec_long_arg() {
  local message="Return should include the configured value for the codec."
  local input_file="TestFile.mp4"
  local codec="test_codec"
  local expected_result="$input_file $codec `default_video_output_dimensions` `default_tune` `default_num_audio_channels` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_video_args -i "$input_file" -c "$codec"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_video_args_with_output_dir_short_arg() {
  local message="Return should include the configured value for the output dir."
  local input_file="TestFile.mp4"
  local output_dir="OutDir"
  local expected_result="$input_file `default_video_codec` `default_video_output_dimensions` `default_tune` `default_num_audio_channels` `default_preset` `default_crop` `default_max_queue` `default_crf` $output_dir"
  
  local result=`read_cut_video_args -i "$input_file" -d "$output_dir"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_video_args_with_output_dir_long_arg() {
  local message="Return should include the configured value for the output dir."
  local input_file="TestFile.mp4"
  local output_dir="OutDir"
  local expected_result="$input_file `default_video_codec` `default_video_output_dimensions` `default_tune` `default_num_audio_channels` `default_preset` `default_crop` `default_max_queue` `default_crf` $output_dir"
  
  local result=`read_cut_video_args -i "$input_file" --output_dir "$output_dir"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_video_args_with_crf_long_arg() {
  local message="Return should include the configured value for the crf."
  local input_file="TestFile.mp4"
  local crf="test_crf"
  local expected_result="$input_file `default_video_codec` `default_video_output_dimensions` `default_tune` `default_num_audio_channels` `default_preset` `default_crop` `default_max_queue` "$crf" `default_output_dir`"
  
  local result=`read_cut_video_args -i "$input_file" --crf "$crf"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_video_args_with_crop_long_arg() {
  local message="Return should include the configured value for the crop."
  local input_file="TestFile.mp4"
  local crop="test_crop"
  local expected_result="$input_file `default_video_codec` `default_video_output_dimensions` `default_tune` `default_num_audio_channels` `default_preset` "$crop" `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_video_args -i "$input_file" --crop "$crop"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_video_args_with_dimensions_long_arg() {
  local message="Return should include the configured value for the dimensions."
  local input_file="TestFile.mp4"
  local dimensions="test_dimensions"
  local expected_result="$input_file `default_video_codec` "$dimensions" `default_tune` `default_num_audio_channels` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_video_args -i "$input_file" --dimensions "$dimensions"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_video_args_with_preset_long_arg() {
  local message="Return should include the configured value for the preset."
  local input_file="TestFile.mp4"
  local preset="test_preset"
  local expected_result="$input_file `default_video_codec` `default_video_output_dimensions` `default_tune` `default_num_audio_channels` "$preset" `default_crop` `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_video_args -i "$input_file" --preset "$preset"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_video_args_with_queue_size_long_arg() {
  local message="Return should include the configured value for the max queue."
  local input_file="TestFile.mp4"
  local max_queue="test_queue_size"
  local expected_result="$input_file `default_video_codec` `default_video_output_dimensions` `default_tune` `default_num_audio_channels` `default_preset` `default_crop` "$max_queue" `default_crf` `default_output_dir`"
  
  local result=`read_cut_video_args -i "$input_file" --queue_size "$max_queue"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_video_args_with_tune_long_arg() {
  local message="Return should include the configured value for the tune."
  local input_file="TestFile.mp4"
  local tune="test_tune"
  local expected_result="$input_file `default_video_codec` `default_video_output_dimensions` "$tune" `default_num_audio_channels` `default_preset` `default_crop` `default_max_queue` `default_crf` `default_output_dir`"
  
  local result=`read_cut_video_args -i "$input_file" --tune "$tune"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_video_args_with_all_short_args() {
  local message="Return should include all configured values."
  local input_file="TestFile.mp4"
  local codec="test_codec"
  local output_dir="TestOutDir"
  local expected_result="$input_file $codec `default_video_output_dimensions` `default_tune` `default_num_audio_channels` `default_preset` `default_crop` `default_max_queue` `default_crf` $output_dir"
  
  local result=`read_cut_video_args -i "$input_file" -c "$codec" -d "$output_dir"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_reading_cut_video_args_with_all_long_args() {
  local message="Return should include all configured values."
  local input_file="TestFile.mp4"
  local codec="test_codec"
  local dimensions="test_dimensions"
  local tune="test_tune"
  local num_audio_channels="8"
  local preset="test_preset"
  local crop="test_crop"
  local max_queue="test_max_queue"
  local crf="test_crf"
  local output_dir="TestOutDir"
  local expected_result="$input_file $codec $dimensions $tune $num_audio_channels $preset $crop $max_queue $crf $output_dir"
  
  local result=`read_cut_video_args --input_file "$input_file" --codec "$codec" --output_dir "$output_dir" --crf "$crf" --crop "$crop" --dimensions "$dimensions" --preset "$preset" --queue_size "$max_queue" --tune "$tune"`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

