#!/bin/bash
set -e 

# Argument check to assign type
if [ "$1" == "o" ]; then
    type="Sink"
fi
if [ "$1" == "i" ]; then
    type="Source"
fi

# retrieve all pipewire as JSON
pw-dump | 
    # Extract only the Audio outputs/inputs
    jq -Mc --arg type "Audio/${type}" '
        .[] | 
        select(.info.props."media.class" == $type) | 
        {id: .id, name: .info.props."node.description"}
    '| 
    # Put results in an array
    jq -Mcs '.'
