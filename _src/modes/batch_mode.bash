#!/bin/bash

#----------------
# Name          : batch_mode.bash
# Description   : Run batch process to convert raw captures from ffmpeg commands in $batch_file
#----------------

source "./_src/messages/errors.bash"

batch_mode() {
  [[ "$VERBOSE" = true ]] && log_arguments "${FUNCNAME[0]}" "$@"
  local batch_file="$1"

  [[ -z "$batch_file" ]] && error_missing_function_args "${FUNCNAME[0]}" "$@"
  [[ ! -f "$batch_file" ]] && error_file_not_found "$batch_file" `batch_mode_name`

  while IFS= read -r command
  do
    eval "$command < /dev/null"
  done < "$batch_file"
}

