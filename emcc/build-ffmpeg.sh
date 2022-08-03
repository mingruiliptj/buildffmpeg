#!/bin/bash -x

cd /tmp/ffmpeg
pwd
ls -la

emconfigure ./configure \
  --prefix=${PREFIX} \
  --target-os=none \
  --arch=x86_32 \
  --enable-cross-compile \
  --disable-debug \
  --disable-x86asm \
  --disable-inline-asm \
  --disable-stripping \
  --disable-programs \
  --disable-doc \
  --disable-all \
  --enable-avcodec \
  --enable-avformat \
  --enable-avfilter \
  --enable-avdevice \
  --enable-avutil \
  --enable-swresample \
  --enable-postproc \
  --enable-swscale \
  --enable-filters \
  --enable-protocol=file \
  --enable-decoder=h264,aac,pcm_s16le \
  --enable-demuxer=mov,matroska \
  --enable-muxer=mp4 \
  --enable-gpl \
  --enable-libx264 \
  --extra-cflags="$CFLAGS" \
  --extra-cxxflags="$CFLAGS" \
  --extra-ldflags="$LDFLAGS" \
  --nm="llvm-nm -g" \
  --ar=emar \
  --as=llvm-as \
  --ranlib=llvm-ranlib \
  --cc=emcc \
  --cxx=em++ \
  --objcc=emcc \
  --dep-cc=emcc

emmake make -j4
# emmake make install

mkdir -p wasm/dist
ARGS=(
  -I. -I./fftools
  -Llibavcodec -Llibavdevice -Llibavfilter -Llibavformat -Llibavresample -Llibavutil -Llibpostproc -Llibswscale -Llibswresample
  -Qunused-arguments
  -o wasm/dist/ffmpeg.js fftools/ffmpeg_opt.c fftools/ffmpeg_filter.c fftools/ffmpeg_hw.c fftools/cmdutils.c fftools/ffmpeg.c
  -lavdevice -lavfilter -lavformat -lavcodec -lswresample -lswscale -lavutil -lm
  -s USE_SDL=2                    # use SDL2
  -s USE_PTHREADS=1               # enable pthreads support
  -s INITIAL_MEMORY=33554432      # 33554432 bytes = 32 MB
  -s ALLOW_MEMORY_GROWTH=1
)
emcc "${ARGS[@]}"
