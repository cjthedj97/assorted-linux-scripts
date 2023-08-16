#!/bin/bash

vpn_interface=cscotun0
internal_IP_checker=https://
defualt_interface=$(ip -4 route show default | awk '{print $5}')

external_IP=$(curl -s $internal_IP_checker --interface $defualt_interface)
internal_IP=$(curl -s $internal_IP_checker --interface $vpn_interface)

echo "Your External IP is : " $external_IP
echo "Your VPN IP is : " $internal_IP
