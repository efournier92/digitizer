#!/bin/bash

### Returns output file name
get_output_file() {
  output_file_name="${1}"
  output_file_extension="${2}"

  echo "./${output_file_name}.${output_file_extension}"
}

