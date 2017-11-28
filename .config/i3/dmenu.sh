#!/bin/sh

# Figure out current screen size
SCREENWIDTH=$(xrandr -q | grep Screen | awk '{print $8}')
SCREENHEIGHT=$(xrandr -q | grep Screen | awk '{print $10}' | sed s/,//)

# How close to the screen edges do we begin/end?
EDGEWIDTH=50
DMENUWIDTH=$(($SCREENWIDTH - $(($EDGEWIDTH + $EDGEWIDTH))))

# dmenu X/Y coordinates
XPOS=$EDGEWIDTH
YPOS=$(($(($SCREENHEIGHT / 2)) - 15))

# FGSELECT="#A3A6AB"
BGSELECT="#568AB4"
FG="#9FA2A7"
BG="#34322E"
FONT="DejaVuSans:size=10"
PROMPT="RUN:"

i3-dmenu-desktop --dmenu="dmenu -i -dim 0.75 -w $DMENUWIDTH -x $XPOS -y $YPOS -p $PROMPT -fn $FONT -nb $BG -nf $FG -sb $BGSELECT"
