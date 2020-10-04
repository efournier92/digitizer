#!/bin/bash

#----------------
# Name          : 
# Description   : 
# Author        : E Fournier
# Dependencies  : 
# Arguments     : 
# Example Usage : 
#----------------

suite()
{
  . ./__tests/args/batch_args_tests.bash
  #. ./__tests/args/capture_args_tests.bash
  #. ./__tests/args/cut_args_tests.bash
  #. ./__tests/args/general_args_tests.bash
  #. ./__tests/args/join_args_tests.bash
  #. ./__tests/args/verbose_args_tests.bash
  #. ./__tests/args/watch_mode_tests.bash
  #. ./__tests/constants/video_defaults_tests.bash
  #. ./__tests/utilities/devices_tests.bash
  #. ./__tests/utilities/fs_tests.bash
  #. ./__tests/utilities/time_tests.bash
  #. ./__tests/messages/help_tests.bash
  #. ./__tests/modes/batch_mode_tests.bash
  #. ./__tests/modes/capture_mode_tests.bash
  #. ./__tests/modes/cut_mode_tests.bash
  #. ./__tests/modes/join_mode_tests.bash
  #. ./__tests/modes/watch_mode_tests.bash
}

# Load testing framework
. ./bin/shunit2

