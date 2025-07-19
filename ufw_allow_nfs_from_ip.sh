#!/bin/bash

ALLOWED_IP=$1

sudo ufw allow from $ALLOWED_IP to any port 111 proto tcp
sudo ufw allow from $ALLOWED_IP to any port 111 proto udp
sudo ufw allow from $ALLOWED_IP to any port 2049 proto tcp
sudo ufw allow from $ALLOWED_IP to any port 2049 proto udp
sudo ufw allow from $ALLOWED_IP to any port 20048 proto tcp
sudo ufw allow from $ALLOWED_IP to any port 20048 proto udp

sudo ufw reload
