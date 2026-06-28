#!/usr/bin/bash

if bluetoothctl show 2>/dev/null | grep -qi "Powered: yes"; then
    bluetoothctl power off
else
    bluetoothctl power on
fi
