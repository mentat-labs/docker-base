FROM debian:jessie
MAINTAINER Mentat Labs Ltd "admin@mentat-labs.com"

## set noninteractive deb env
ENV DEBIAN_FRONTEND noninteractive

## Update
RUN apt-get update\
  &&  apt-get upgrade -y \
  && apt-get install locales -yq 

## locales
RUN dpkg-reconfigure locales && \
  locale-gen en_US.UTF-8 && \
  /usr/sbin/update-locale en_US.UTF-8

# Install needed default locale for Makefly
RUN echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && \
  locale-gen

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8