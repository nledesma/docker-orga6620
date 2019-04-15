FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y openssh-server && \
    apt-get install -y expect && \
    apt-get install -y net-tools

RUN useradd -m gxemul
RUN echo "gxemul:orga6620" | chpasswd

WORKDIR /usr/src/

ENV DEBIAN_FRONTEND teletype
