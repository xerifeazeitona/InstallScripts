#!/bin/bash
# final adjustments

# Downloads dotfiles from github and places in home folder only overwriting conflicts
echo Downloading and installing config files...
cd /tmp
dir=$(mktemp -d)
[ ! -d "/home/$1" ] && mkdir -p "/home/$1" && chown -R "$1:wheel" "/home/$1"
chown -R "$name:wheel" "$dir"
sudo -u "$1" git clone https://github.com/xerifeazeitona/dotfiles.git "$dir/gitrepo" >/dev/null 2>&1 &&
sudo -u "$1" cp -rfT "$dir/gitrepo" "/home/$1"
rm -f "/home/$1/README.md" "/home/$1/LICENSE"

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

# the end
echo All done! Provided there were no errors, you can log with $1 and start using the system!
