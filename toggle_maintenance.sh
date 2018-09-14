#!/usr/bin/env bash

if [ -f ./reverse_proxy/html/maintenance.txt ]; then
    rm ./reverse_proxy/html/maintenance.txt
    echo "maintenance mode: OFF"
else
    touch ./reverse_proxy/html/maintenance.txt
    echo "maintenance mode: ON"
fi

echo ""
echo "Go to http://localhost and perform a hard refresh"
echo "Windows/Linux: Ctrl + Shift + R"
echo "               Ctrl + F5"
echo "OSX          : Cmd + Shift + R or Shift + Reload_button"
