#!/bin/bash

# DEFAULTS
in_file="$1"
out_name="$2"
in_start_time="00:00:00"
out_end_time="04:00:00"
video_codec="libx264"
out_dir="OUT"
crf="28"
tuning="film"
preset="slow"
yadif=""
out_max_queue="400"
out_ext="mp4"
out_crop="600:440:20:20"
out_dimensions="720:540"

get_ffmpeg_command() {
  local in_file="$1"
  local in_start_time="$2"
  local video_codec="$3"
  local crf="$4"
  local tuning="$5"
  local preset="$5"
  local yadif="$6"
  local out_crop="$7"
  local out_dimensions="$8"
  local out_end_time="$9"
  local out_max_queue="$10"

  echo "ffmpeg
    -i $in_file -ss $in_start_time
    -c:v $video_codec -crf $crf -tune $tuning -preset $preset
    -vf \"yadif $yadif,crop=$out_crop,scale=$out_dimensions\"
    -profile:v baseline -level 3.0 -pix_fmt yuv420p
    -c:a aac -ac 2 -b:a 128k
    -t $out_end_time
    -max_muxing_queue_size $out_max_queue
    -movflags faststart
    `out_file`"
}

main() {
  local params=`read_command_arguments "$@"`
  
  if [[ mode == "capture" ]]; ther

  elif [[ mode == "trim" ]]; then
  elif [[ mode == "convert" ]]; then
  fi
  exec `get_ffmpeg_command `
}

main "$@"
