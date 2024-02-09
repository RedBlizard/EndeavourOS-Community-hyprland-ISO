#.../airootfs/etc/systemd/system/getty@tty1.service.d...


[Service]
Type=simple
Environment=XDG_SESSION_TYPE=wayland
Environment=XDG_CURRENT_DESKTOP=Hyprland
Environment=XDG_SESSION_DESKTOP=Hyprland
ExecStart=
ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin liveuser %I $TERM
