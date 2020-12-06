#!/bin/bash

#----------------
# Name          : help_tests.bash
# Description   : Unit test help funcionality
#----------------

source "./_src/messages/help.bash"
source "./_src/utils/constants.bash"

test_print_help_by_mode_with_no_mode() {
  local message="It should print the full help menu."
  local expected_result=`print_help_all`
  
  local result=`print_help_by_mode`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_print_help_by_mode_with_capture_video_mode() {
  local message="It should print the help menu for capture-video-mode."
  local mode=`capture_video_mode_name`
  local expected_result=`print_help_capture_video`
  
  local result=`print_help_by_mode "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_print_help_by_mode_with_capture_audio_mode() {
  local message="It should print the help menu for capture-audio-mode."
  local mode=`capture_audio_mode_name`
  local expected_result=`print_help_capture_audio`
  
  local result=`print_help_by_mode "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_print_help_by_mode_with_cut_video_mode() {
  local message="It should print the help menu for cut-mode."
  local mode=`cut_video_mode_name`
  local expected_result=`print_help_cut_video`
  
  local result=`print_help_by_mode "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_print_help_by_mode_with_batch_mode() {
  local message="It should print the help menu for batch-mode."
  local mode=`batch_mode_name`
  local expected_result=`print_help_batch`

  local result=`print_help_by_mode "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_print_help_by_mode_with_join_mode() {
  local message="It should print the help menu for join-mode."
  local mode=`join_mode_name`
  local expected_result=`print_help_join`
  
  local result=`print_help_by_mode "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_print_help_by_mode_with_watch_mode() {
  local message="It should print the help menu for watch-mode."
  local mode=`watch_mode_name`
  local expected_result=`print_help_watch`
  
  local result=`print_help_by_mode "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

. ./bin/shunit2

