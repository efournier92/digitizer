#!/bin/bash

#----------------
# Name          : time.bash
# Description   : Utility functions for returning timestamps
#----------------

time_now() {
  echo $(date '+%y%m%d%H%M%S')
}

time_now_short() {
  echo $(date '+%H%M%S')
}

timestamp_regex() {
  echo "[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}"
}

