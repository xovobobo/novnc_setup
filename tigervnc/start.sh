#!/bin/bash

DISPLAY="${1:-"1"}"
VNC_SHARED_PORT="${2:-"8080"}"

VNC_LOCAL_PORT=590${DISPLAY}

pkill -f "novnc_proxy --listen ${VNC_SHARED_PORT}"
vncserver --kill :${DISPLAY}

vncserver :${DISPLAY}
/opt/novnc/utils/novnc_proxy --listen ${VNC_SHARED_PORT} --vnc localhost:590${DISPLAY}