#/bin/bash

# Parse arguments
DISPLAY="${1:-"1"}"
VNC_SHARED_PORT="${2:-"8080"}"

VNC_LOCAL_PORT=590${DISPLAY}

cleanup() {
  echo "Cleanup..."
  pkill -f "Xvfb :${DISPLAY}"
  pkill -f "novnc_proxy --listen ${VNC_SHARED_PORT}"
  pkill -f "x11vnc -display :${DISPLAY}"
  if [ -n "$FLUXBOX_PID" ]; then
    kill "$FLUXBOX_PID" > /dev/null 2>&1
  fi
}

trap cleanup EXIT

cleanup

Xvfb :${DISPLAY} -screen 0 1920x1080x24 &

while ! xdpyinfo -display :${DISPLAY} > /dev/null 2>&1; do
  sleep 0.1
done

x11vnc -display :${DISPLAY} -rfbport ${VNC_LOCAL_PORT}  -nopw  -rfbauth ~/.vnc/passwd &
DISPLAY=:${DISPLAY} fluxbox &
FLUXBOX_PID=$!
echo "PID IS:"
echo $FLUXBOX_PID
/opt/novnc/utils/novnc_proxy --listen ${VNC_SHARED_PORT} --vnc localhost:${VNC_LOCAL_PORT}

wait
