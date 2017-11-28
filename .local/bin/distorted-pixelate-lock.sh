#!/bin/bash
scrot -z /tmp/screen.png
convert /tmp/screen.png -filter point -resize 10% -resize 1000% /tmp/screen.png
pkill -u $USER -USR1 dunst
i3lock -n -e -f -i /tmp/screen.png \
    --insidecolor=373445ff --ringcolor=ffffffff --line-uses-inside \
    --keyhlcolor=d23c3dff --bshlcolor=d23c3dff --separatorcolor=00000000 \
    --insidevercolor=fecf4dff --insidewrongcolor=d23c3dff \
    --ringvercolor=ffffffff --ringwrongcolor=ffffffff --indpos="x+86:y+1003" \
    --radius=15 --veriftext="" --wrongtext=""
pkill -u $USER -USR2 dunst


rm /tmp/screen.png
