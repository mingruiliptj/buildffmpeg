#!/bin/sh
set -x -v
docker rm ffmpeggpu
docker run --name ffmpeggpu -e NVIDIA_DRIVER_CAPABILITIES=compute,utility,video -v $(pwd):/data --net=host -i ffmpeggpu:latest
# td ffmpeg-nvidia-gpu /bin/bash
