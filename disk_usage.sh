#!/bin/bash
# Disk usage check

threshold=90
current_usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

if [ "$current_usage" -gt "$threshold" ]; then
  echo "Disk usage is above threshold at ${current_usage}%."
fi
