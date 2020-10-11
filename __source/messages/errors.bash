#!/bin/bash

#----------------
# Name          : errors.bash
# Description   : Library of functions for throwing runtime errors
#----------------

error_missing_function_args() {
  local function_name="$1"
  local args="$2"

  echo "ERROR: Arguments missing from called function $@"

  exit
}

error_missing_required_arg() {
  local required_arg="$1"
  local function_name="$2"

  echo "ERROR: required argument [$required_arg] not found in function $function_name"

  exit
}

error_file_not_found() {
  local file=$1
  local function_name="$2"

  echo "ERROR: input file [$file] not found in function $function_name"

  exit
}

error_dir_not_found() {
  local dir=$1
  local function_name="$2"

  echo "ERROR: directory [$file] not found in function $function_name"

  exit
}

error_device_not_found() {
  local device="$1"
  local function_name="$2"

  echo "ERROR: Device [$device] was not found in function $function_name"

  exit
}

error_mode_not_found() {
  local mode="$1"
  local function_name="$2"

  echo "ERROR: Mode [$mode] was not found in function $function_name"

  exit
}

