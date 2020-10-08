#!/bin/bash

#----------------
# Name          : logs.bash
# Description   : Library of functions for printing info logs in verbose mode
#----------------

source $(dirname $0)/utilities/time.bash
source $(dirname $0)/constants/defaults.bash

log_arguments() {
  local function_name="$1"
  local arguments="$2"

  echo "INFO: $function_name [$arguments]" >&2
}

