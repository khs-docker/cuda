FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04
MAINTAINER khs <darkflash76@gmail.com>

ADD resources/timezone.sh /timezone.sh

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN sh /timezone.sh ubuntu
RUN apt-get update && apt-get install -y vim python3 python3-pip
RUN cd /usr/bin && ln -s python3.5 python
RUN apt-get install -y netbase
# for opencv2
RUN apt-get install -y libgomp1 libglib2.0-0 libsm6 libxrender1 libxext6
# RUN apt-get install -y ffmpeg
RUN pip3 install ipython