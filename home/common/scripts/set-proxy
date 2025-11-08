#!/usr/bin/env bash

if [[ $1 = "on" ]]; then
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
    export all_proxy="socks5://127.0.0.1:7890"
elif [[ $1 = "off" ]]; then
    unset http_proxy
    unset https_proxy
    unset all_proxy
else
    echo "Usage: source set-proxy on/off"
fi
