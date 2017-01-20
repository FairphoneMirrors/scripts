#!/bin/bash

this=$(pwd)
systemd=/etc/systemd/system/
sudo ln -s $this/fp_update.service $systemd
sudo ln -s $this/fp_update.timer $systemd
echo ">> You might want to enable fp_update.timer"
