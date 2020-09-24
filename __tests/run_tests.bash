
suite()
{
  . ./constants/video_defaults_tests.bash
  . ./ffmpeg/capture_video_tests.bash
  . ./input/arguments/read_command_arguments_tests.bash
  . ./input/selection/select_device_tests.bash
  . ./logging/print_video_details_tests.bash
  . ./utilities/fs_tests.bash
  . ./utilities/time_tests.bash
  . ./utilities/devices_tests.bash
}

# Load testing framework
. ../bin/shunit2
