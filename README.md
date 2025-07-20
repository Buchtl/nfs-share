```
echo "password" | openssl passwd -1 -stdin

netstat -ntlp

sudo journalctl -u docker.service -f

sudo mkdir -p /mnt/nfs/shared
sudo mount -v server-ip:/srv/nfs/shared /mnt/nfs/shared
```

```
sudo apt update
sudo apt install nfs-common
sudo mkdir -p /mnt/nfs/shared
sudo mount server-ip:/srv/nfs/shared /mnt/nfs/shared

```