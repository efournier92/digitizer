#!/bin/bash

#----------------
# Name          : logs.bash
# Description   : Library of functions for printing info logs in verbose mode
#----------------

source $(dirname $0)/utilities/time.bash
source $(dirname $0)/constants/defaults.bash

log_arguments() {

  echo "INFO: $@" >&2
}

