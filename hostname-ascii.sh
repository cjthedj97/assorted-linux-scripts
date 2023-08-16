#!/bin/bash
#This script adds Ascii art that is generated based on the hostname to the MOTD File on Ubuntu 16.04
# Built for Ubuntu 16.04
echo $HOSTNAME | figlet > /etc/motd
echo $HOSTNAME | figlet
