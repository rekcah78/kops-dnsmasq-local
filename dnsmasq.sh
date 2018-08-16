#!/bin/bash

cat <<EOF >> /etc/network/interfaces
auto lo:0
iface lo:0 inet static
 address 198.18.0.1
 netmask 255.255.255.255
 broadcast 198.18.0.1
EOF


cat <<EOF > /etc/dnsmasq.d/dnsmasq.conf
cache-size=1000
log-queries
dns-forward-max=1500
all-servers
neg-ttl=30
bind-interfaces
interface=lo:0
listen-address=198.18.0.1

server=/cluster.local/100.64.0.10#53
server=/in-addr.arpa/100.64.0.10#53
server=/ip6.arpa/100.64.0.10#53
EOF
