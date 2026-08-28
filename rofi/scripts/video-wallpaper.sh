#!/usr/bin/env bash

VIDEO_DIR="$HOME/Videos"
OUTPUT="${1:-ALL}"   # Pass a monitor name, e.g. HDMI-A-1, or use ALL

# Select a video with rofi
SELECTED=$(
    find "$VIDEO_DIR" -type f -print0 |
        while IFS= read -r -d '' video; do
            [[ "$video" =~ \.(mp4|mkv|webm|avi|mov|gif|MP4|MKV|WEBM|AVI|MOV|GIF)$ ]] || continue

            REL_PATH="${video#$VIDEO_DIR/}"

            # Use the video itself as the rofi icon
            printf '%s\0icon\x1f%s\n' "$REL_PATH" "$video"
        done |
        rofi \
            -dmenu \
            -i \
            -show-icons \
            -theme "$HOME/.config/rofi/themes/wallpaper.rasi" \
            -p ""
)

if [[ -n "$SELECTED" ]]; then
    VIDEO_PATH="$VIDEO_DIR/$SELECTED"

    # Stop any currently running mpvpaper instance
    pkill -x mpvpaper 2>/dev/null

    # Play the selected video on the chosen output
    mpvpaper \
        -o "no-audio --loop-file=inf --panscan=1.0" \
        "$OUTPUT" \
        "$VIDEO_PATH" &
fi

