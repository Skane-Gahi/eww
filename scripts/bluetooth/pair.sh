#!/usr/bin/expect -f

set DEV [lindex $argv 0]

set timeout 5

spawn bluetoothctl
expect "Agent registered"

send "pair ${DEV}\n"
expect "Request confirmation"

send "yes\n"
expect "Pairing successful"

exit


