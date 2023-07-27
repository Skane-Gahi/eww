#!/bin/bash
set -e

output=$(bluetoothctl show | grep "Powered")

if [[ "$output" == *"yes"* ]]; then
    echo true
    exit 0
fi

echo false
exit 0