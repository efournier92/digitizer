#!/bin/bash

#----------------
# Name          : run_tests.bash
# Description   : Runs project test suite
# Author        : E Fournier
# Dependencies  : shunit2
# Example Usage : bash run_tests.bash
#----------------

suite()
{
  #. ./__tests/args/batch_args_tests.bash
  #. ./__tests/args/capture_args_tests.bash
  #. ./__tests/args/cut_args_tests.bash
  #. ./__tests/args/general_args_tests.bash
  #. ./__tests/args/join_args_tests.bash
  #. ./__tests/args/verbose_args_tests.bash
  #. ./__tests/args/watch_mode_tests.bash
  #. ./__tests/constants/defaults_tests.bash
  #. ./__tests/utilities/devices_tests.bash
  #. ./__tests/utilities/time_tests.bash
  #. ./__tests/utilities/modes_tests.bash
  #. ./__tests/messages/help_tests.bash
  #. ./__tests/modes/batch_mode_tests.bash
  #. ./__tests/modes/capture_mode_tests.bash
  #. ./__tests/modes/cut_mode_tests.bash
  . ./__tests/modes/join_mode_tests.bash
  #. ./__tests/modes/watch_mode_tests.bash
}

# Load testing framework
. ./bin/shunit2

