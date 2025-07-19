#!/bin/bash
IP=$1
sudo mount -v $IP:/srv/nfs/shared /mnt/testshare
