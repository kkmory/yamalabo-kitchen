#!/bin/bash
sudo adduser yamalabo
sudo usermod yamalabo -g sudo
su yamalabo
systemctl reboot -i
