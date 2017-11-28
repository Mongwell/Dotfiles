#!/bin/bash

icon_enabled="   enabled"
icon_disabled="   disabled"
status=`systemctl is-active bluetooth.service`

if [ $status == "active" ]
then
	echo "$icon_enabled"
else
	echo "$icon_disabled"
fi
