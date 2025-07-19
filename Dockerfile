FROM ubuntu:24.04

ARG PASSWORD

RUN apt update -y \
    && apt upgrade -y

RUN apt install -y nfs-kernel-server

RUN groupadd -g 2000 nfs \
    && echo ${PASSWORD} | openssl passwd -1 -stdin \
    && ENCRPYTED_PASSWORD=`echo "${PASSWORD}" | openssl passwd -1 -stdin` \
    && useradd -rm -d /home/nfs -s /bin/bash -u 2000 nfs -g nfs -p ${ENCRPYTED_PASSWORD}

RUN mkdir -p /srv/nfs/shared \
    && chown nfs:nfs /srv/nfs/shared \
    && chmod 777 /srv/nfs/shared \
    && echo "/srv/nfs/shared 0.0.0.0/0(rw,sync,no_subtree_check)" >> /etc/exports

EXPOSE 2049/tcp 2049/udp 111/tcp 111/udp

CMD ["/usr/sbin/rpcbind", "-w", "&&", "/usr/sbin/rpc.nfsd", "&&", "/usr/sbin/exportfs", "-r", "&&", "tail", "-f", "/dev/null"]

