#!/bin/sh

BLANK='#ffffff88'
CLEAR='#ffffff88'
DEFAULT='#315f80aa'
TEXT='#315f80aa'
WRONG='#3797c2aa'
VERIFYING='#a6aa8b77'

$HOME/builds/i3lock-color/build/i3lock \
-i $HOME/Documents/lockscreen.png \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"       \
