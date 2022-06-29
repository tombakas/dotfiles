#!/bin/bash

LANG1="us"
LANG1_variant=""

LANG2="lt"
LANG2_variant=""

LANG3="ru"
LANG3_variant="phonetic"

CURRENT_LANG=$(setxkbmap -query | awk '/layout/{print $2}')
echo $CURRENT_LANG

case $CURRENT_LANG in
    $LANG1)
        setxkbmap $LANG2 -variant "$LANG2_variant"
        ;;
    $LANG2)
        setxkbmap $LANG3 -variant "$LANG3_variant"
        ;;
    $LANG3)
        setxkbmap $LANG1 -variant "$LANG1_variant"
        ;;
    *)
        setxkbmap $LANG1 -variant "$LANG1_variant"
        ;;
esac

killall -USR1 i3status
