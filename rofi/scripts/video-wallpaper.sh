#!/usr/bin/env bash

VIDEO_DIR="$HOME/Videos/wallpapers"
OUTPUT="${1:-ALL}"
STOP_LABEL="Stop video wallpaper"

SELECTED=$(
    {
        # Video options
        find "$VIDEO_DIR" -type f -print0 |
            while IFS= read -r -d '' video; do
                [[ "$video" =~ \.(mp4|mkv|webm|avi|mov|gif|m4v|MP4|MKV|WEBM|AVI|MOV|GIF|M4V)$ ]] || continue

                REL_PATH="${video#$VIDEO_DIR/}"
                printf '%s\n' "$REL_PATH"
            done

        # Stop option last
        printf '%s\n' "$STOP_LABEL"
    } |
        rofi \
            -dmenu \
            -i \
            -no-sort \
	    -show-icons \
            -theme "$HOME/.config/rofi/themes/wallpaper.rasi" \
            -p ""
)

if [[ -z "$SELECTED" ]]; then
    exit 0
fi

if [[ "$SELECTED" == "$STOP_LABEL" ]]; then
    pkill -x mpvpaper 2>/dev/null
    exit 0
fi

VIDEO_PATH="$VIDEO_DIR/$SELECTED"

pkill -x mpvpaper 2>/dev/null

mpvpaper \
    -o "no-audio --loop-file=inf --panscan=1.0" \
    "$OUTPUT" \
    "$VIDEO_PATH" &

