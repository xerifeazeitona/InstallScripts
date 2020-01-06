#!/bin/bash
# Setup locale
echo =-=-=-=-=-=-
echo Locale setup
echo =-=-=-=-=-=-
sed -i "s/#en_US/en_US/" /etc/locale.gen > /dev/null 2>&1
locale-gen
echo LANG=en_US.UTF-8 >> /etc/locale.conf
echo LC_COLLATE=C >> /etc/locale.conf
export LANG=en_US.UTF-8
echo Synching time to timezone...
ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime
hwclock --systohc --utc
