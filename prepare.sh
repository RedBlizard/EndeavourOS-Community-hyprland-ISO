#!/usr/bin/env bash

# Get mirrorlist for offline installs
wget -qN --show-progress -P "airootfs/etc/pacman.d/" "https://raw.githubusercontent.com/endeavouros-team/EndeavourOS-ISO/main/mirrorlist"

# Get wallpaper for installed system
wget -qN --show-progress -P "airootfs/root/" "https://raw.githubusercontent.com/endeavouros-team/endeavouros-theming/master/backgrounds/endeavouros-wallpaper.png"

# Make sure build scripts are executable
chmod +x "./"{"mkarchiso","run_before_squashfs.sh"}

# prebuild AUR packages

yay -S --makepkgconf ~/Github/EndeavourOS-Community-hyprland-ISO/makepkg.conf --noconfirm brave-bin wlogout-git wlr-randr swww networkmanager-dmenu-bluetoothfix-git
cp ~/Github/EndeavourOS-Community-hyprland-ISO/aurbuilds/* ~/Github/EndeavourOS-Community-hyprland-ISO/airootfs/root/packages/
#sudo pacman -Rsc --noconfirm brave-bin networkmanager-dmenu-bluetoothfix-git swww wlogout-git wlr-randr

# Build liveuser skel
cd "airootfs/root/endeavouros-skel-liveuser"
makepkg -f
