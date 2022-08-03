#!/bin/sh
set -x -v

# xyshyniaphy
# 8X6*piRhpLkpcS%
docker login


docker tag ffmpeggpu:latest xyshyniaphy/ffmpeggpu:latest
docker push xyshyniaphy/ffmpeggpu:latest