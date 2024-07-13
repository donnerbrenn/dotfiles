#!/bin/bash

RETURN=`ddcutil -d 2 getvcp 0x60`
SUB='0x0f'
echo $RETURN
echo $SUB

if grep -q "$SUB" <<< "$RETURN"; then
	echo 1
	exit 1
else
	echo 0
	exit 0
fi
