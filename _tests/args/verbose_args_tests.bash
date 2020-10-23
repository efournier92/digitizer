#!/bin/bash

#----------------
# Name          : verbose_args_tests.bash
# Description   : Unit test reading arguments for verbose mode
#----------------

source ./args/verbose_args.bash

test_read_verbose_args_with_no_args() {
  local message="It should "
  local expected_result="false"
  
  local result=`read_verbose_args`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_read_verbose_args_with_verbose_short_arg() {
  local message="It should "
  local expected_result="true"
  
  local result=`read_verbose_args -v`
  
  assertEquals "$message" "$expected_result" "$result"
}

test_read_verbose_args_with_verbose_long_arg() {
  local message="It should "
  local expected_result="true"
  
  local result=`read_verbose_args --verbose`
  
  assertEquals "$message" "$expected_result" "$result"
}

suite_addTest test_read_verbose_args_with_no_args
suite_addTest test_read_verbose_args_with_verbose_short_arg
suite_addTest test_read_verbose_args_with_verbose_long_arg

