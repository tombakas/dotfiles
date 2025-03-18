#!/usr/bin/env bash

mapTildeKey () {
  if [ "$(uname)" = "Darwin" ]; then
    hidutil property --set \
      '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064},{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035}]}'
  fi
  exit
}

unMapTildeKey () {
  if [ "$(uname)" = "Darwin" ]; then
    hidutil property --set \
      '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000035},{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000064}]}'
  fi
  exit
}

echo "Pick an option:"
printf "\t1. Map switch of \` and §\n"
printf "\t2. Unmap switch of \` and §\n"

while true ; do
  if ! read -r -t 3 -n 1 key; then
    exit ;
  else
    case "$key" in
      1) mapTildeKey
      ;;
      2) unMapTildeKey
      ;;
      q) exit
      ;;
    esac
  fi
done
