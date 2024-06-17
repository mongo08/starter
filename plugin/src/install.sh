#!/bin/bash

mkdir -p /home/user/.config/systemd/user/
mv /etc/systemd/system/StartPO.service /home/user/.config/systemd/user/
systemctl --user enable StartPO.service