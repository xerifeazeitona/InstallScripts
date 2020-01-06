#!/bin/bash
# setup hostname
hostname=$1
echo =-=-=-=-=-=-=-
echo Hostname setup
echo =-=-=-=-=-=-=-
echo "Creating hostname..."
echo $hostname > /etc/hostname
echo "Creating hosts file..."
echo -e "127.0.0.1\tlocalhost" >> /etc/hosts
echo -e "::1\t\tlocalhost" >> /etc/hosts
echo -e "127.0.0.1\t"$hostname".localdomain\t"$hostname >> /etc/hosts
echo Done!
