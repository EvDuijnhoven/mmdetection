FROM nvidia/cuda:10.1-devel-ubuntu18.04 AS base

# Set up locale to prevent bugs with encoding
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

WORKDIR /workspace

LABEL com.nvidia.volumes.needed="nvidia_driver"

RUN echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list

RUN apt-get update && \
      apt-get install -y apt-utils && \
      apt-get install -y \
            wget \
            curl \
            libsm6 \
            libxext6 \
            libxrender-dev \
            build-essential \
            libnccl2=2.4.7-1+cuda10.1 \
            libnccl-dev=2.4.7-1+cuda10.1 \
            python3 \
            python3-pip && \
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PYTHON_VERSION=3.6
COPY ./requirements.txt ./requirements.txt
RUN xargs -n1 pip3 install < ./requirements.txt
RUN pip3 install setuptools --upgrade


# COPY . ./

# RUN python3 setup.py develop

# RUN mkdir /.cache && chmod -R a+rw /.cache/