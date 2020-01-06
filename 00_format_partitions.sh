#!/bin/bash
# format and mount the partitions
#
# Variables
boot=$1
root=$2
home=$3
swap=$4
echo =-=-=-=-=-=-=
echo Partitioning
echo =-=-=-=-=-=-=
# Format partitions
# format boot
echo Creating EFI system partition...
mkfs.fat -F32 -n EFI $boot > /dev/null 2>&1
# format root
echo Creating ROOT filesystem...
mkfs.ext4 -L ROOT $root > /dev/null 2>&1
# format home
echo Creating HOME filesystem...
mkfs.ext4 -L HOME $home > /dev/null 2>&1
# format and activate swap
echo Creating SWAP partition...
mkswap -L SWAP $swap > /dev/null 2>&1
swapon $swap
# Mount partitions
# root
echo Mounting ROOT partition...
mount $root /mnt
# boot
echo Mounting BOOT partition...
mkdir -pv /mnt/boot/EFI
mount $boot /mnt/boot/EFI
# home
echo Mounting HOME partition...
mkdir -pv /mnt/home
mount $home /mnt/home
echo Partitions are mounted and ready for installation!
