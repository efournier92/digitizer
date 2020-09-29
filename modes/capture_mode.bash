### Begin capture process using FFmpeg
get_capture_command() {
  local video_device="$1"
  local audio_device="$2"
  local codec="$3"
  local crf="$4"
  local video_format="$5"
  local audio_format="$6"
  local preset="$7"
  local size="$8"
  local standard="$9"
  local stop_time="${10}"
  local theads="${11}"
  local tune="${12}"
  local output_format="${13}"
  local output_location="${14}"
  
  mkdir -p "${output_location%/*}"

  echo "ffmpeg -standard "$standard" -f "$video_format" -video_size "$size" -thread_queue_size "$threads" -i "$video_device" -f "$audio_format" -thread_queue_size "$threads" -i "$audio_device" -c:v "$codec" -tune "$tune" -preset "$preset" -crf "$crf" -t "$stop_time" -f "$output_format" - | ffmpeg -i - -c copy "$output_location" -c copy -f s32le pipe:play | ffplay -i pipe:play -nodisp"
}

run_capture_command() {
  ffmpeg_command="$1"

  eval "$ffmpeg_command"
}

capture_mode() {
  local ffmpeg_command=`get_capture_command "$@"`

  run_capture_command "$ffmpeg_command"
}

