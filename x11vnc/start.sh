#!/bin/bash

# Parse arguments
DISPLAY="${1:-"1"}"
VNC_SHARED_PORT="${2:-"8080"}"

VNC_LOCAL_PORT=590${DISPLAY}

pkill -f "Xvfb :${DISPLAY}"
pkill -f "novnc_proxy --listen ${VNC_SHARED_PORT}"

Xvfb :${DISPLAY} -screen 0 1920x1080x24 &
x11vnc -display :${DISPLAY} -rfbport ${VNC_LOCAL_PORT}  -nopw  -rfbauth ~/.vnc/passwd &
DISPLAY=:${DISPLAY} fluxbox &
/opt/novnc/utils/novnc_proxy --listen ${VNC_SHARED_PORT} --vnc localhost:${VNC_LOCAL_PORT}