#!/bin/bash
sudo ufw deny 111/tcp
sudo ufw deny 111/udp
sudo ufw deny 2049/tcp
sudo ufw deny 2049/udp
sudo ufw deny 20048/tcp
sudo ufw deny 20048/udp

sudo ufw reload

