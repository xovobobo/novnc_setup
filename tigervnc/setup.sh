#!/bin/bash

VNC_PASSWORD="vnc123"

base_setup_file=$PWD/../.base/setup.sh

source $base_setup_file

apt install -y tigervnc-standalone-server

echo $VNC_PASSWORD | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd