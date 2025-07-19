FROM ubuntu:24.04

ARG PASSWORD

RUN apt update -y \
    && apt upgrade -y

RUN apt install -y nfs-kernel-server \
    && mkdir -p /srv/nfs/shared

RUN groupadd nfs \
    && echo ${PASSWORD} | openssl passwd -1 -stdin \
    && ENCRPYTED_PASSWORD=`echo "${PASSWORD}" | openssl passwd -1 -stdin` \
    && useradd -rm -d /home/ubuntu -s /bin/bash -u 2000 nfs-user -p ${ENCRPYTED_PASSWORD} \
    && chown nfs-user:nfs /srv/nfs/shared \
    && chmod 777 /srv/nfs/shared \
    && echo "/srv/nfs/shared 0.0.0.0/24(rw,sync,no_subtree_check)" >> /etc/exports \
    && exportfs -ra

ENTRYPOINT ["tail", "-f", "/dev/null"]
