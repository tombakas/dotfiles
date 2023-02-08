#!/usr/bin/env bash

DEVICE=$(xinput list | grep Touchpad | awk '{print $6}' | tr -d -C [0-9]a)
PROPS=$(xinput list-props $DEVICE)

TAPPING_ENABLED=$(echo "$PROPS" | awk '/Tapping Enabled \(/{gsub("[A-Za-z():]", "", $0); print $1}')
NATURAL_SCROLLING=$(echo "$PROPS" | awk '/Natural Scrolling Enabled \(/{gsub("[A-Za-z():]", "", $0); print $1}')

if [ ! -e "$TAPPING_ENABLED" ]; then
    echo "Enabling tapping"
    xinput set-prop $DEVICE $TAPPING_ENABLED 1
fi

if [ ! -e "$NATURAL_SCROLLING" ]; then
    echo "Enabling natural scrolling"
    xinput set-prop $DEVICE $NATURAL_SCROLLING 1
fi
