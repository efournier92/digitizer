#!/bin/bash

#----------------
# Name          : video_defaults
# Description   : Returns contstants
# Arguments     : $mode, 
#----------------

source $(dirname $0)/constants/video_defaults.bash

get_convert_command() {
  local mode="$1"
  local input="$2"
  local dimensions="$3"
  local crf="$4"
  local preset="$5"
  local crop="$6"
  local output_location="$7"

  echo "ffmpeg -i $input -c:v `get_default_video_codec` -crf $crf -tune `get_default_tuning` -preset $preset -vf yadif=0:0:0,crop=`get_default_crop`,scale=$dimensions -profile:v baseline -level 3.0 -pix_fmt yuv420p -c:a aac -ac 2 -b:a 128k -max_muxing_queue_size `get_default_max_queue` -movflags faststart ${output_location}"
}

