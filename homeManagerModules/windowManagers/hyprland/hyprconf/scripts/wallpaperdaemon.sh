#!/usr/bin/env sh

swww query
if [ $? -eq 1 ]; then
  swww-daemon
fi
