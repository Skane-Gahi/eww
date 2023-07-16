#!/bin/bash
set -e

# Get workspace number from args
WORKSPACE_NUMBER=$1

workspaces () {
    # Retrieve active workspaces in json format
	WORKSPACE_WINDOWS=$(hyprctl workspaces -j | 
        jq 'map({key: .id | tostring, value: .windows}) | from_entries')
	
    # Create workspaces mapping windows with the previous result
    seq 1 $WORKSPACE_NUMBER | 
        jq --argjson windows "${WORKSPACE_WINDOWS}" --slurp -Mc \
            'map(tostring) | map({id: ., windows: ($windows[.]//0)})'
}

# Call the function once
workspaces
# Then, call it each time the workspace changes
socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | 
    while read -r line; do workspaces
done