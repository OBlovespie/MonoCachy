#!/usr/bin/env bash
SOUND_FILE="/home/fm1/Music/lbpnotification.mp3"


dnd_state="$(swaync-client -D 2>/dev/null | tr -d '\r\n' | tr '[:upper:]' '[:lower:]')"


if echo "$dnd_state" | grep -Eq '^(1|on|true|enabled)$'; then
  exit 0
fi

mpv --no-video --really-quiet "$SOUND_FILE"
