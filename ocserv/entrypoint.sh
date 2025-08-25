#!/bin/bash

IFACE=$(ip -o -4 route show default | awk '{print $5; exit}')
iptables -t nat -C POSTROUTING -s 10.99.0.0/24 -o "$IFACE" -j MASQUERADE 2>/dev/null || \
iptables -t nat -A POSTROUTING -s 10.99.0.0/24 -o "$IFACE" -j MASQUERADE
iptables -C FORWARD -i vpns+ -o "$IFACE" -j ACCEPT 2>/dev/null || \
iptables -A FORWARD -i vpns+ -o "$IFACE" -j ACCEPT
iptables -C FORWARD -i "$IFACE" -o vpns+ -m state --state ESTABLISHED,RELATED -j ACCEPT 2>/dev/null || \
iptables -A FORWARD -i "$IFACE" -o vpns+ -m state --state ESTABLISHED,RELATED -j ACCEPT

#tail -f /dev/null
ocserv --log-stderr -f
