
suite()
{
  #. ./__tests/constants/video_defaults_tests.bash
  #. ./__tests/ffmpeg/capture_video_tests.bash
  #. ./__tests/ffmpeg/convert_capture_tests.bash
  ##. ./__tests/input/arguments/read_command_arguments_tests.bash
  #. ./__tests/input/selection/select_device_tests.bash
  . ./__tests/cut/cut_segments_tests.bash
  #. ./__tests/logging/print_video_details_tests.bash
  #. ./__tests/utilities/fs_tests.bash
  #. ./__tests/utilities/time_tests.bash
  #. ./__tests/utilities/devices_tests.bash
}

# Load testing framework
. ./bin/shunit2

