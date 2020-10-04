#!/bin/bash

#----------------
# Name          : time_tests.bash
# Description   : Unit test time utility functions
#----------------

source ./__source/utilities/time.bash

test_time_now() {
  local message="It should return the current date-time formatted as an integer."
  local expected_result=`date '+%y%m%d%H%M%S'`

  local result=`time_now`

  assertEquals "${expected_result}" "${result}"
}

test_time_now_short() {
  local message="It should return the current time formatted as an integer."
  local expected_result=`date '+%H%M%S'`

  local result=`time_now_short`

  assertEquals "${expected_result}" "${result}"
}

suite_addTest test_time_now
suite_addTest test_time_now_short

