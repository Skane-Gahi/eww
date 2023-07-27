#!/bin/bash
set -e

coproc scan { bluetoothctl ; }
echo -e "scan on\n" >&"${scan[1]}"

while true; do
    output=$(bluetoothctl devices)
    echo "$output" | 
        jq -sR '[
            split("\n") | 
            .[] | 
            split("Device ")[1:] |
            .[] |
            {
                addr: .[:17], 
                name: .[18:]
            }
        ]'
    sleep 1
done