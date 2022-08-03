#!/bin/sh
set -x -v
docker rm ffmpegwasm0
docker run --name ffmpegwasm0  -v $(pwd):/data --net=host -i ffmpegwasm:latest
# td ffmpeg-nvidia-gpu /bin/bash
