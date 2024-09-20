#!/bin/bash

DISPLAY="${1:-"1"}"
VNC_SHARED_PORT="${2:-"8080"}"

VNC_LOCAL_PORT=590${DISPLAY}

cleanup() {
    echo "Cleanup..."
    pkill -f "novnc_proxy --listen ${VNC_SHARED_PORT}"
    vncserver --kill :${DISPLAY}
}

trap cleanup EXIT

XSTARTUP_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/xstartup"
cleanup
vncserver :${DISPLAY} -xstartup $XSTARTUP_FILE
/opt/novnc/utils/novnc_proxy --listen ${VNC_SHARED_PORT} --vnc localhost:590${DISPLAY}

wait
