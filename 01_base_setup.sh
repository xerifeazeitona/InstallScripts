#!/bin/bash
# Installs base-devel, git and AUR helper
# Arguments username (yay can't be installed as root)
echo Making pacman and yay colorful...
grep "^Color" /etc/pacman.conf > /dev/null || sed -i "s/^#Color/Color/" /etc/pacman.conf
grep "ILoveCandy" /etc/pacman.conf > /dev/null || sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf

echo Installing base-devel...
pacman --noconfirm --needed -S base-devel

echo Installing git...
pacman --noconfirm --needed -S git

echo Enabling all cores for compilation...
sed -i "s/-j2/-j$(nproc)/;s/^#MAKEFLAGS/MAKEFLAGS/" /etc/makepkg.conf

echo Installing AUR helper...
cd /tmp
rm -rf /tmp/yay*
curl -sO https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
sudo -u $1 tar -xvf yay.tar.gz
cd yay
sudo -u $1 makepkg --noconfirm -si
cd /tmp
echo Base setup completed.
