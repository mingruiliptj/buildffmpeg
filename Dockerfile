FROM nvidia/cuda:11.7.0-devel-ubuntu20.04
ENV DEBIAN_FRONTEND=noninteractive
# timezone setting
ENV TZ=Asia/Tokyo 
 
WORKDIR /tmp
 
#此步骤主要是拉取官方的源码比较慢的时候 采取在外面拉取了添加目录进去
#ADD ffmpeg ffmpeg
RUN apt-get update -y && apt-get install -y build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev frei0r-plugins-dev libgnutls28-dev libass-dev \
libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libopus-dev librtmp-dev libsoxr-dev libspeex-dev libtheora-dev libvo-amrwbenc-dev libvorbis-dev libvpx-dev libwebp-dev \
libx264-dev libx265-dev libxvidcore-dev libjpeg-dev

ADD ff.tar.gz ./
ADD nvcodec.tar.gz ./
ADD build-ffmpeg.sh build-ffmpeg.sh
RUN ./build-ffmpeg.sh