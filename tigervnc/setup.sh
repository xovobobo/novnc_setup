#!/bin/bash

VNC_PASSWORD="vnc123"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
base_setup_file=$SCRIPT_DIR/../.base/setup.sh

source $base_setup_file

apt install -y tigervnc-standalone-server

echo $VNC_PASSWORD | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd
