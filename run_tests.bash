
suite()
{
  #. ./__tests/constants/video_defaults_tests.bash
  #. ./__tests/ffmpeg/capture_video_tests.bash
  #. ./__tests/ffmpeg/convert_capture_tests.bash
  #. ./__tests/input/selection/select_device_tests.bash
  #. ./__tests/cut/cut_segments_tests.bash
  #. ./__tests/logging/print_video_details_tests.bash
  #. ./__tests/utilities/fs_tests.bash
  #. ./__tests/utilities/time_tests.bash
  #. ./__tests/utilities/devices_tests.bash

  #. ./__tests/args/capture_args_tests.bash
  . ./__tests/args/general_args_tests.bash
  . ./__tests/args/batch_args_tests.bash
  . ./__tests/args/cut_args_tests.bash
}

# Load testing framework
. ./bin/shunit2

