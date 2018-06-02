#!/bin/bash

if [[ -z $(netstat -tln | grep 127.0.0.1:1234) ]]; then
  echo "VM not running"
  exit
fi

killall synergy synergyc

nc -N 127.0.0.1 1234 << END
device_del usb_kbd
device_del usb_mouse
system_powerdown
END

~/.scripts/sys_setkb.sh
