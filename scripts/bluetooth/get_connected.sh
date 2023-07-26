#!/bin/bash
set -e

devices=$(
    bluetoothctl devices Connected | 
        jq -sR '[split("\n") | .[:-1] | .[] | split(" ")[2:] | join(" ")]'
)

echo $devices