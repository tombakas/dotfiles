#!/usr/bin/env bash

LANG_VARIANT_ARR=(us, lt, ru,phonetic)

OPTIONS=""

for i in ${!LANG_VARIANT_ARR[@]}; do
    if [ $i -gt 0 ]; then
        OPTIONS="${OPTIONS}\n"
    fi
    OPTIONS="${OPTIONS}$(echo ${LANG_VARIANT_ARR[i]} | sed 's/,[a-z]*//')"
done

CHOICE=$(echo -e $OPTIONS | rofi -dmenu -format i)

LANG=$(echo ${LANG_VARIANT_ARR[CHOICE]} | cut -d , -f 1)
VARIANT=$(echo ${LANG_VARIANT_ARR[CHOICE]} | cut -d , -f 2)

setxkbmap $LANG -variant "$VARIANT"

killall -USR1 i3status
