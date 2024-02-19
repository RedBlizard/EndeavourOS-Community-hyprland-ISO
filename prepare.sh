#!/usr/bin/env bash

# Get mirrorlist for offline installs
wget -qN --show-progress -P "airootfs/etc/pacman.d/" "https://raw.githubusercontent.com/endeavouros-team/EndeavourOS-ISO/main/mirrorlist"

# Get wallpaper for installed system
wget -qN --show-progress -P "airootfs/root/" "https://raw.githubusercontent.com/endeavouros-team/endeavouros-theming/master/backgrounds/endeavouros-wallpaper.png"

# Make sure build scripts are executable
chmod +x "./"{"mkarchiso","run_before_squashfs.sh"}

# prebuild AUR packages

yay -S --makepkgconf ~/Documents/hyprland/EndeavourOS-Community-hyprland-ISO/makepkg.conf --noconfirm cava wlogout nwg-look-bin swww networkmanager-dmenu-bluetoothfix-git
cp ~/Documents/hyprland/EndeavourOS-Community-hyprland-ISO/aurbuilds/* ~/Documents/hyprland/EndeavourOS-Community-hyprland-ISO/airootfs/root/packages/
#sudo pacman -Rsc --noconfirm networkmanager-dmenu-bluetoothfix-git swww wlogout nwg-look-bin cava

# Build liveuser skel
cd "airootfs/root/endeavouros-skel-liveuser"
makepkg -f
