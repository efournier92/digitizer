#!/bin/bash

source $(dirname $0)/utilities/devices.bash

### 
test_detect_video_devices() {
  local message="It should use ls to find video devices"
  ls() { echo "/dev/video8 /dev/video9" ; }
  local expected_result="/dev/video8 /dev/video9"

  result=`detect_video_devices`
  
  assertContains "${result}" "${expected_device_name}"
}

### 
test_detect_audio_devices_with_single_device() {
  local message="It should return a properly formatted transformation of device returned from ls"
  ls() { echo "/dev/snd/pcmC8D8c" ; }
  expected_result="hw:8,8"

  result=`detect_audio_devices`
  
  assertEquals "${expected_result}" "${result}"
}

### 
test_detect_audio_devices_with_multiple_devices() {
  local message="It should return properly formatted transformations of devices returned from ls"
  ls() { echo "/dev/snd/pcmC7D7c /dev/snd/pcmC8D8c /dev/snd/pcmC9D9c" ; }
  expected_result="hw:7,7 hw:8,8 hw:9,9"

  result=`detect_audio_devices`
  
  assertEquals "${expected_result}" "${result}"
}

suite_addTest test_detect_video_devices
suite_addTest test_detect_audio_devices_with_single_device
suite_addTest test_detect_audio_devices_with_multiple_devices
