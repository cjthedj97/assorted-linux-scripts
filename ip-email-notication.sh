#!/bin/bash
# Base script from https://raspberrypi.stackexchange.com/questions/22016/how-to-write-an-ip-change-notifier-script-in-xbian/22021#22021

NOWIP=$(curl ipecho.net/plain 2>/dev/null)
OLDIP=$(cat /tmp/myoldip 2>/dev/null)

if [[ "$NOWIP" = "$OLDIP" ]]; then
   echo "IP address is still $NOWIP"
else
   echo "old was $OLDIP, new is $NOWIP"
   echo $NOWIP >/tmp/myoldip
   # send e-mail here
fi
