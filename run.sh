#!/bin/bash
# This script starts the wireguard connection

SERVER_IP=${SERVER_IP:-192.168.127.1}
DNS_IP=${DNS_IP:-192.168.127.1}

graceful_exit() {
  wg-quick down wg0
}

set_dns() {
  grep -q '^nameserver '${DNS_IP} /etc/resolv.conf || sed '/search/a nameserver '${DNS_IP} /etc/resolv.conf | tee -a /etc/resolv.conf
}

trap graceful_exit err exit
wg-quick up wg0
set_dns
ping -c 3 ${SERVER_IP}
wg

sleep 86400
