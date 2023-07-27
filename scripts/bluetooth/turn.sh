#!/bin/bash
set -e

if [[ "$1" == "on" ]];then
    bluetoothctl power on
    exit 0
fi

if [[ "$1" == "off" ]];then
    bluetoothctl power off
    exit 0
fi

exit 1