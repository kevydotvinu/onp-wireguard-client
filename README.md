# OpenShift Network Playground - Wireguard

## Run container
```
sudo podman build . -t localhost/wireguard
sudo podman run --name wireguard --detach --net host --privileged --volume /etc/wireguard:/etc/wireguard --mount
type=bind,source=/etc/resolv.conf,target=/etc/resolv.conf localhost/wireguard
```
