if [[ -z $1 ]]; then
    echo "Argument: on / off"
elif [[ $1 = "on" ]]; then
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
    export all_proxy="socks5://127.0.0.1:7890"
elif [[ $1 = "off" ]]; then
    unset http_proxy
    unset https_proxy
    unset all_proxy
else
    echo "Argument: on / off"
fi
