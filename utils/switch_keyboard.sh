#!/usr/bin/env bash

LANG_VARIANT_ARR=(us, lt, ru,phonetic)
PREV_LANG_FILE=/tmp/prev_lang_choice.txt

if [ -f $PREV_LANG_FILE ]; then
    PREV_LANG_CHOICE=$(cat $PREV_LANG_FILE)
fi

OPTIONS=""

CURRENT_LANG=$(setxkbmap -query | awk '/layout/{print $2}')
echo $CURRENT_LANG > $PREV_LANG_FILE

for i in ${!LANG_VARIANT_ARR[@]}; do
    if [ $i -gt 0 ]; then
        OPTIONS="${OPTIONS}\n"
    fi
    if [[ "${LANG_VARIANT_ARR[i]}" == *"$PREV_LANG_CHOICE"* ]]; then
        SELECTED=$i
    fi
    OPTIONS="${OPTIONS}$(echo ${LANG_VARIANT_ARR[i]} | sed 's/,[a-z]*//')"
done

CHOICE=$(echo -e $OPTIONS | rofi -dmenu -format i -selected-row $SELECTED)

LANG=$(echo ${LANG_VARIANT_ARR[CHOICE]} | cut -d , -f 1)
VARIANT=$(echo ${LANG_VARIANT_ARR[CHOICE]} | cut -d , -f 2)

setxkbmap $LANG -variant "$VARIANT"

killall -USR1 i3status
