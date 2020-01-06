#!/bin/sh
# master script nice comments here
# variables
boot=/dev/sda1
root=/dev/sda3
home=/dev/sda4
swap=/dev/sda2
# Format partitions
./00_format_partitions.sh $boot $root $home $swap
# Updates mirrorlist, run pacstrap, create fstab, enters chroot
./01_base_installation.sh
# unmounts everything
echo unmounting...
umount -R /mnt
# the end
echo All done! Provided there were no errors, you can log with $1 and start using the system!
