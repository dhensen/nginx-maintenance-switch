#!/usr/bin/env bash

if [ -f ./reverse_proxy/html/maintenance.txt ]; then
    rm ./reverse_proxy/html/maintenance.txt
    echo "maintenance mode: OFF"
else
    touch ./reverse_proxy/html/maintenance.txt
    echo "maintenance mode: ON"
fi
