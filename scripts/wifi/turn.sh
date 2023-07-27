#!/bin/bash
set -e

if [[ "$1" == "on" ]];then
    nmcli radio wifi on
    exit 0
fi

if [[ "$1" == "off" ]];then
    nmcli radio wifi off
    exit 0
fi

exit 1