#!/bin/bash

# ----------------------------
# MIGHT NOT WORK
# 
# Only keeping for reference later...
# ----------------------------


########### Initial wifi interface configuration #############
ip link set $1 down
ip addr flush dev $1
ip link set $1 up
ip addr add 10.0.0.1/24 dev $1
 
# If you still use ifconfig for some reason, replace the above lines with the following
# ifconfig $1 up 10.0.0.1 netmask 255.255.255.0
sleep 2
###########
 
########### Start dnsmasq ##########
if [ -z "$(ps -e | grep dnsmasq)" ]
then
 dnsmasq
fi
###########
########### Enable NAT ############
iptables -t nat -A POSTROUTING -o $2 -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $1 -o $2 -j ACCEPT
 
#Thanks to lorenzo
#Uncomment the line below if facing problems while sharing PPPoE, see lorenzo's comment for more details
#iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
 
sysctl -w net.ipv4.ip_forward=1
###########
########## Start hostapd ###########
hostapd /etc/hostapd/hostapd.conf
killall dnsmasq
