#!/bin/bash
set -e

device="$1"

coproc bt { bluetoothctl ; }

expect () {
    while read -r line; do
        echo $line
        if [[ "$line" == *"$1"* ]]; then
            return 0
        fi
    done <&"${bt[0]}"
}

timeout 3 cat <( expect "Agent registered" )

echo -e "pair ${device}\n" >&"${bt[1]}"
timeout 10 cat <( expect "Request confirmation" )

echo -e "yes\n" >&"${bt[1]}"
timeout 5 cat <( expect "Pairing successful" )

exit 0
