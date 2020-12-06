#!/bin/bash

#----------------
# Name          : time.bash
# Project       : digitizer
# Description   : Utility functions for time
#----------------

timestamp_regex() {
  echo "[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}"
}

time_now() {
  echo $(date '+%y%m%d%H%M%S')
}

