#!/bin/bash

apt update && apt install fluxbox unzip wget git terminator -y

wget https://github.com/novnc/noVNC/archive/refs/tags/v1.3.0.zip -O novnc.zip && \
unzip novnc.zip && \
mv noVNC-1.3.0 /opt/novnc && \
rm novnc.zip

git clone https://github.com/novnc/websockify /opt/novnc/utils/websockify

mkdir -p ~/.vnc
