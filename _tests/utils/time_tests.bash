#!/bin/bash

#----------------
# Name          : time_tests.bash
# Description   : Unit test time utility functions
#----------------

source "./_src/utils/time.bash"

test_time_now() {
  local message="It should return the current date-time formatted as an integer."
  local expected_result=`date '+%y%m%d%H%M%S'`

  local result=`time_now`

  assertEquals "${expected_result}" "${result}"
}

. ./bin/shunit2

