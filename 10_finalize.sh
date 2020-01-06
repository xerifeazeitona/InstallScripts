#!/bin/bash
# final adjustments
echo =-=-=-=-=-=
echo Final Steps
echo =-=-=-=-=-=
# Gets rid of that annoying beeping error sound
echo Turning off system beep...
rmmod pcspkr
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

# Adjusts permissions in sudoers file
echo Adjusting permissions in sudoers file for user $1...
sed -i '$d' /etc/sudoers
echo "%wheel ALL=(ALL) ALL #INSTALLER" >> /etc/sudoers
echo "%wheel ALL=(ALL) NOPASSWD: /usr/bin/shutdown,/usr/bin/reboot,/usr/bin/systemctl suspend,/usr/bin/wifi-menu,/usr/bin/mount,/usr/bin/umount/,/usr/bin/pacman -Syyu,/usr/bin/packer -Syu,/usr/bin/packer -Syyu,/usr/bin/systemctl restart NetworkManager,/usr/bin/rc-service NetworkManager restart,/usr/bin/loadkeys,/usr/bin/yay,/usr/bin/pacman -Syyuw --noconfirm #INSTALLER" >> /etc/sudoers

# Make zsh the default shell for the user
echo Setting zsh as default shell for user $1...
usermod -s /bin/zsh $1

# dbus UUID must be generated for Artix runit
dbus-uuidgen > /var/lib/dbus/machine-id

# Let xorg know which WM is supposed to run
echo Setting i3 as WM for X...
echo exec i3 > /home/$1/.xinitrc
chown $1:wheel /home/$1/.xinitrc

# Exits chroot
read -p "All done here! Press [Enter] to exit chroot (Did you passwd root btw?)"
exit
