#!/bin/bash
# Install bootloader
echo =-=-=-=-=-=-=-=-=-=-=
echo Installing Bootloader
echo =-=-=-=-=-=-=-=-=-=-=
echo "Installing grub..."
pacman --noconfirm --needed -S grub > /dev/null 2>&1
echo "Installing os-prober..."
pacman --noconfirm --needed -S os-prober > /dev/null 2>&1
echo "Installing efibootmgr..."
pacman --noconfirm --needed -S efibootmgr > /dev/null 2>&1
echo "Setting up grub..."
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --efi-directory=/boot/EFI --recheck
grub-mkconfig -o /boot/grub/grub.cfg
echo "Creating initial ramdisk for LTS kernel (this might take a while)..."
mkinitcpio -p linux-lts > /dev/null 2>&1
echo "Done!"
