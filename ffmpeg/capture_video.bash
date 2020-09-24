### Begin capture process using FFmpeg
run_capture_process() {
  input_stream_standard="${1}"
  input_video_format="${2}"
  output_video_size="${3}"
  output_max_threads="${4}"
  input_video_device="${5}"
  input_audio_device="${6}"
  input_audio_device="${7}"
  output_video_codec="${8}"
  output_tuning="${9}"
  output_speed_preset="${10}"
  output_constant_rate_factor="${11}"
  output_duration="${12}"
  output_format="${13}"

  ffmpeg \
    -standard "${input_stream_standard}" \
    -f "${input_video_format}" -video_size "${output_video_size}" -thread_queue_size "${output_max_threads}" \
    -i "${input_video_device}" \
    -f "${input_audio_format}" -thread_queue_size "${output_max_threads}" -i "${input_audio_device}" \
    -c:v "${output_video_codec}" -tune "${output_tuning}" -preset "${output_speed_preset}" -crf "${output_constant_rate_factor}" \
    -t "${output_duration}" -f "${output_format}" - | \
    ffmpeg -i - -c copy `output_file` \
      -c copy -f s32le pipe:play | \
      ffplay -i pipe:play -nodisp
}
