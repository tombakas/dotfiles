#!/bin/bash

UNAME=$(uname)

if [ "$UNAME" == "Linux" ] ; then
	false
elif [ "$UNAME" == "Darwin" ] ; then
	osascript -e 'tell application "Spotify" to playpause'
elif [[ "$UNAME" == CYGWIN* || "$UNAME" == MINGW* ]] ; then
	false
fi
