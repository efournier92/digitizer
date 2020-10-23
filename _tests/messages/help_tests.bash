#!/bin/bash

#----------------
# Name          : help_tests.bash
# Description   : Unit test help funcionality
#----------------

source ./messages/help.bash
source ./constants/defaults.bash

test_print_help_by_mode_with_no_mode() {
  local message="It should print the full help menu."
  local expected_result=`print_help_all`
  
  local result=`print_help_by_mode`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_print_help_by_mode_with_capture_mode() {
  local message="It should print the help menu for capture-mode."
  local mode=`capture_mode_name`
  local expected_result=`print_help_capture`
  
  local result=`print_help_by_mode "$mode"`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_print_help_by_mode_with_cut_mode() {
  local message="It should print the help menu for cut-mode."
  local mode=`cut_mode_name`
  local expected_result=`print_help_cut`
  
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

suite_addTest test_print_help_by_mode_with_no_mode
suite_addTest test_print_help_by_mode_with_capture_mode
suite_addTest test_print_help_by_mode_with_cut_mode
suite_addTest test_print_help_by_mode_with_batch_mode
suite_addTest test_print_help_by_mode_with_join_mode
suite_addTest test_print_help_by_mode_with_watch_mode

