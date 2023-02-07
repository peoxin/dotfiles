#!/usr/bin/env bash

if [[ -z $1 ]]; then
    echo "Missing argument: on / off"
elif [[ $1 = "on" ]]; then
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
    export no_proxy="localhost, 127.0.0.1, ::1"
elif [[ $1 = "off" ]]; then
    unset http_proxy
    unset https_proxy
    unset no_proxy
else
    echo "Valid argument: on / off"
fi
