#!/bin/bash
# update mirrorlist, start installation, create filesystem, chroot, install packages
# Variables
echo =-=-=-=-=-=-=-=-=
echo Base Installation
echo =-=-=-=-=-=-=-=-=
# mirrorlist
echo "Updating mirrorlist..."
pacman --noconfirm --needed -Sy archlinux-keyring # > /dev/null 2>&1
pacman --noconfirm --needed -Sy reflector # > /dev/null 2>&1
reflector --country 'Canada' --age 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
# pacstrap
echo "Starting installation (this might take a while)..."
pacstrap /mnt base base-devel linux linux-firmware linux-lts vim # > /dev/null 2>&1
# fstab
echo "Creating filesystem table..."
genfstab -U /mnt >> /mnt/etc/fstab
echo "Copying scripts to /mnt/installation..."
mkdir -pv /mnt/installation
cp *.sh /mnt/installation
echo "Base installation completed!"
# chroot
read -p "Press [Enter] key to chroot..."
arch-chroot /mnt
