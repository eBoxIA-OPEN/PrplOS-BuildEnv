# syntax=docker/dockerfile:1
FROM openwrtorg/sdk

USER root

RUN apt-get update && \
    apt-get install -y python3-yaml && \
    apt clean

RUN apt-get update && \
    apt-get install -y \
    	    emacs-nox \
	    sudo \
	    mlocate && \
    apt clean

RUN useradd -m builder -p 'builder'
RUN echo 'builder         ALL = NOPASSWD: ALL' > /etc/sudoers.d/1_builder

WORKDIR /openwrt

USER build
ENV TMP=/tmp
