#!/usr/bin/bash

echo "Setting up jack source/sink"
pacmd load-module module-jack-source channels=2
pacmd load-module module-jack-sink channels=2
