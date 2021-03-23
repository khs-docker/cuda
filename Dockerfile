FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
MAINTAINER khs <darkflash76@gmail.com>

ADD resources/timezone.sh /timezone.sh
ADD resources/Python-3.8.8.tgz /usr/src/Python-3.8.8.tgz

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN sh /timezone.sh ubuntu
RUN apt-get install -y wget build-essential checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev netbase
RUN cd /usr/src
RUN tar -zxvf Python-3.8.8.tgz
RUN cd Python-3.8.8
RUN ./configure --enable-optimizations && make altinstall
RUN update-alternatives --install /usr/bin/python python /usr/local/bin/python3.8 1
# for opencv2
# RUN apt-get install -y libgomp1 libglib2.0-0 libsm6 libxrender1 libxext6
# RUN apt-get install -y ffmpeg
RUN pip3.8 install ipython