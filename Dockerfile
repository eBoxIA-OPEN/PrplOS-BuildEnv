# syntax=docker/dockerfile:1
# $Id: Dockerfile,v 1.1 2022/06/20 16:31:27 bibi Exp $
FROM debian:buster

RUN apt-get update && \
    apt-get install -y \
    	    build-essential ccache ecj fastjar file g++ gawk \
	    gettext git java-propose-classpath libelf-dev libncurses5-dev \
	    libncursesw5-dev libssl-dev python python2.7-dev python3 unzip wget \
	    python-distutils-extra python3-setuptools python3-dev rsync subversion \
	    swig time xsltproc zlib1g-dev && \
    apt clean

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

USER builder
ENV TMP=/tmp
