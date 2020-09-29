#!/bin/bash

#----------------
# Name          : batch_convert
# Description   : Run batch process to convert raw captures from ffmpeg commands in $batch_file
# Arguments     : $batch_file
#----------------

batch_mode() {
  local batch_file="$1"

  while IFS= read -r command
  do
    eval "$command < /dev/null"
  done < "$batch_file"
}

