#!/bin/bash
set -e

# Retrieve available wifis with nmcli
wifis=$(nmcli -f ssid -t dev wifi |
    jq -sRMc '
        split("\n") |
        .[0:-1] |
        unique |
        map(select(length > 0))
    '
)

# Return result
echo $wifis