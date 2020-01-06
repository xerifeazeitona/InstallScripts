#!/bin/sh
# nice comment here create user and group
# Arguments username and password
echo =-=-=-=-
echo Add user 
echo =-=-=-=-
echo Creating user $1...
useradd -m -g wheel -s /bin/bash $1
echo Adding $1 to relevant groups...
usermod -aG users,audio,video,storage,power,input,optical,sys,log,network,floppy,scanner,rfkill,lp,adm $1
echo Creating home directory for $1...
mkdir -p /home/$1
chown $1:wheel /home/$1
echo Setting password for $1...
echo $1:$2 | chpasswd
echo Adding $1 to sudoers...
[ -f /etc/sudoers.bak ] && cp /etc/sudoers /etc/sudoers.bak
echo "%wheel ALL=(ALL) NOPASSWD: ALL #INSTALER" >> /etc/sudoers
echo Finished creating user $1.
