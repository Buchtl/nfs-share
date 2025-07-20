#!bin/bash
STACK_NAME=nfs-client
docker stack rm $STACK_NAME
docker swarm leave --force
docker system prune
docker volume rm nfs-client_nfs-data nfs-client_nfs-filestorage
