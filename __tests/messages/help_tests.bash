#!/bin/bash

#----------------
# Name          : help_tests
# Description   : Unit test help funcionality
#----------------

source ./messages/help.bash
source ./constants/defaults.bash

test_show_help_with_no_mode() {
  local message="It should "
  local expected_result=`print_help_all`
  
  local result=`print_help_menu`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_show_help_with_capture_mode() {
  local message="It should "
  local mode=`capture_mode_name`
  local expected_result=`print_help_capture`
  
  local result=`print_help_menu "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_show_help_with_cut_mode() {
  local message="It should "
  local mode=`cut_mode_name`
  local expected_result=`print_help_cut`
  
  local result=`print_help_menu "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_show_help_with_batch_mode() {
  local message="It should "
  local mode=`batch_mode_name`
  local expected_result=`print_help_batch`

  local result=`print_help_menu "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_show_help_with_join_mode() {
  local message="It should "
  local mode=`join_mode_name`
  local expected_result=`print_help_join`
  
  local result=`print_help_menu "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_show_help_with_watch_mode() {
  local message="It should "
  local mode=`watch_mode_name`
  local expected_result=`print_help_watch`
  
  local result=`print_help_menu "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

suite_addTest test_show_help_with_no_mode
suite_addTest test_show_help_with_capture_mode
suite_addTest test_show_help_with_cut_mode
suite_addTest test_show_help_with_batch_mode
suite_addTest test_show_help_with_join_mode
suite_addTest test_show_help_with_watch_mode

