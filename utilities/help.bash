print_help() {
  echo $(cat <<< EOF
Options:
  General:
    -h, --help            print help information

    -m, --mode            choose mode
                            capture
                            convert
                            batch
                            cut
                            join

    -i, --input           input video file or device
                   
    -a, --audio_input     input audio file or device

    -ss, --start_time     start timestamp (ex [00:00:00.000])

    -t, --end_time        end timestamp (ex [00:00:00.000])

    -d, --output_dir      directory in which it save the output file

    -o, --output_name     name for the output file

  Capture:
    -i, --video_device 
  
  Convert:
    --size

    --crf

    --preset

    --yadif

    --crop

  Batch:

