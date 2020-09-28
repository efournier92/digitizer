#!/bin/bash 

### Detects available video devices
#### Sets array of devices to a global variable: $available_video_devices
detect_video_devices() {
  echo `ls -d /dev/video*`
}

### Detects available ALSA devices
#### Sets array of devices to a global variable: $available_audio_devices
detect_audio_devices() {
  devices_path="/dev/snd/"
  available_device_builder="$(echo `ls -d ${devices_path}pcmC*D*c`)"
  available_device_builder="${available_device_builder//pcmC/hw:}"
  available_device_builder="${available_device_builder//c/}"
  available_device_builder="${available_device_builder//D/,}"
  available_audio_devices="${available_device_builder//${devices_path}/}"

  echo "${available_audio_devices}"
}

