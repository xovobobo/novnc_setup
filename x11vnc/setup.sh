#!/bin/bash

VNC_PASSWORD="vnc123"

base_setup_file=$PWD/../.base/setup.sh

source $base_setup_file

apt install -y xvfb x11vnc

x11vnc --storepasswd ${VNC_PASSWORD} ~/.vnc/passwd
chmod 600 ~/.vnc/passwd
