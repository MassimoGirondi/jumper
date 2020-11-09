#!/bin/sh

sudo ssh-keygen -A
#chmod 644 /etc/ssh/ssh_host_*

#PASSWORD=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 8`
PASSWORD=`pwgen -s 8 1`
#echo $PASSWORD | passwd  --stdin
echo "`whoami`:$PASSWORD" | sudo chpasswd
echo "---------------------------------------------"
echo "The password for user `whoami` is $PASSWORD"
echo "---------------------------------------------"


sudo /usr/sbin/sshd -D -e
