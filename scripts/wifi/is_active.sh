#!/bin/bash
set -e

# Retrieve wifi status
check=$(nmcli radio wifi)

# Convert result to bool
if [ $check == "enabled" ]; then
    echo true
fi
if [ $check == disabled ]; then
    echo false
fi