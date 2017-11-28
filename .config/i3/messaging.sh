#!/bin/bash
i3 split h
messengerfordesktop %U & 
sleep 4
telegram-desktop -- %U & 
sleep 2
/opt/groupme/GroupMe &
sleep 2

i3 split v

slack &
i3 split h
sleep 5
discord &

