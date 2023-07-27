#!/bin/bash
set -e

# Retrieve available wifis with nmcli
active=$(
    nmcli -t -f name,type c show --active | 
    grep '802-11-wireless' | 
    cut -d ':' -f 1
)

if [ "$active" == "" ]; then
    echo "Not connected"
    exit
fi

# Return result
echo $active