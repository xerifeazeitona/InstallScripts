#!/bin/sh
# master script nice comments here
# variables
user=$1
password=$2
# Install essential packages
./02_essentials.sh
# Install bootloader
./03_bootloader.sh
# Config hostname
./04_hostname.sh
# Config locale
./05_locale.sh
# create user
./06_add_user.sh $user $password
# pacman rice, extra cores, yay
./07_extras.sh $user
# Bulk installation of all necessary packages
./08_programs.sh $user
# Copies dotfiles to home dir
./09_dotfiles.sh $user
# Final adjustments
./10_finalize.sh $user
