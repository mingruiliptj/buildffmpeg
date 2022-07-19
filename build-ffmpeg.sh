
#!/bin/sh
 
# git clone https://github.com/ffmpeg/ffmpeg.git
#国内源
# git clone https://gitee.com/mirrors/ffmpeg.git

set -x -v

pwd
ls -la

cd /tmp/nv-codec-headers-sdk-11.0/
pwd
make
make install

cd /tmp/ffmpeg
pwd
ls -la
# git checkout release/5.1
#/tmp/ffmpeg/configure --prefix="/tmp/ffmpeg" --enable-nonfree --disable-shared --enable-nvenc --enable-cuda --enable-cuvid --enable-libnpp --extra-cflags=-Ilocal/include --enable-gpl --enable-version3 --disable-debug --disable-ffplay --disable-indev=sndio --disable-outdev=sndio --enable-fontconfig --enable-frei0r --enable-gnutls --enable-gray --enable-libass --enable-libfreetype --enable-libfribidi --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopus --enable-libopenjpeg --enable-librtmp --enable-libsoxr --enable-libspeex --enable-libtheora --enable-libvo-amrwbenc --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxvid --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64

./configure --prefix="/tmp/ffmpeg" --disable-doc  --disable-debug --enable-small --disable-ffplay \
    --extra-cflags="-I/tmp/ffmpeg/include -I/usr/local/cuda/include" \
    --extra-ldflags="-L/tmp/ffmpeg/lib -L/usr/local/cuda/lib64"  \
    --extra-libs=-lpthread  --extra-libs=-lm  --bindir="/root/bin" --enable-version3 \
    --enable-fontconfig --enable-frei0r --enable-gnutls --enable-gray --enable-libass --enable-libfreetype --enable-libfribidi --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopus --enable-librtmp --enable-libsoxr --enable-libspeex --enable-libtheora --enable-libvo-amrwbenc --enable-libvorbis --enable-libvpx --enable-libwebp \
    --enable-gpl   --enable-libx264 --enable-libx265  --enable-nonfree \
    --enable-cuda \
    --enable-cuvid \
    --enable-nvenc \
    --enable-libnpp \
    && make -j 8 && make install 



#   --pkg-config-flags="--static" --enable-static --disable-shared --extra-libs=-static --extra-cflags=--static \