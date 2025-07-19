FROM ubuntu:24.04

RUN apt update -y \
    && apt upgrade -y

RUN apt install -y nfs-kernel-server \
    && mkdir -p /srv/nfs/shared

RUN groupadd nfs \
    && useradd -rm -d /home/ubuntu -s /bin/bash -u 2000 nfs-user \
    && chown nfs-user:nfs /srv/nfs/shared \
    && chmod 777 /srv/nfs/shared \
    && echo "/srv/nfs/shared 0.0.0.0/24(rw,sync,no_subtree_check)" >> /etc/exports \
    && exportfs -ra


ENTRYPOINT ["tail", "-f", "/dev/null"]
