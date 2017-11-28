#!/bin/bash
if xinput list-props 16 | grep "Device Enabled (139):	1" ; then
    xinput disable 16 ;
else
    xinput enable 16 ;
fi
