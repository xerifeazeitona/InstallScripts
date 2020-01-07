#!/bin/bash
# final adjustments
echo =-=-=-=-
echo Dotfiles
echo =-=-=-=-
# Downloads dotfiles from github and places in home folder only overwriting conflicts
echo Downloading and installing config files...
cd /tmp
dir=$(mktemp -d)
[ ! -d "/home/$1" ] && mkdir -p "/home/$1" && chown -R "$1:wheel" "/home/$1"
chown -R "$1:wheel" "$dir"
sudo -u "$1" git clone https://github.com/xerifeazeitona/dotfiles.git "$dir/gitrepo" >/dev/null 2>&1 &&
sudo -u "$1" cp -rfT "$dir/gitrepo" "/home/$1"
rm -f "/home/$1/README.md" "/home/$1/LICENSE"
echo Done!
