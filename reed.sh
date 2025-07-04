#!/bin/bash

echo "[+] Installing required KDE packages..."
sudo pacman -S --noconfirm breeze-kde4 kde-gtk-config konsole

echo "[+] Creating Konsole theme directory..."
mkdir -p ~/.local/share/konsole

echo "[+] Creating custom color scheme: darkweb.colorscheme"
cat > ~/.local/share/konsole/darkweb.colorscheme <<EOF
[Background]
Color=30,30,30
[BackgroundIntense]
Color=45,45,45
[Foreground]
Color=240,240,240
[ForegroundIntense]
Color=255,0,0
[General]
Description=DarkWeb Neon
Opacity=0.90
[Color0]
Color=40,40,40
[Color1]
Color=180,0,90
[Color2]
Color=120,255,120
[Color3]
Color=255,90,0
[Color4]
Color=150,80,255
[Color5]
Color=200,100,200
[Color6]
Color=80,250,250
[Color7]
Color=200,200,200
[Color8]
Color=90,90,90
[Color9]
Color=255,0,120
[Color10]
Color=0,255,0
[Color11]
Color=255,255,0
[Color12]
Color=100,100,255
[Color13]
Color=255,100,255
[Color14]
Color=100,255,255
[Color15]
Color=255,255,255
EOF

echo "[+] Creating custom profile: DarkWeb"
cat > ~/.local/share/konsole/DarkWeb.profile <<EOF
[General]
Name=DarkWeb
ColorScheme=darkweb
Icon=utilities-terminal
Command=/bin/bash
EOF

echo "[+] Setting profile as default in konsolerc"
mkdir -p ~/.config
cat > ~/.config/konsolerc <<EOF
[Desktop Entry]
DefaultProfile=DarkWeb.profile
EOF

echo "[+] Done! You can now open Konsole with the new theme 💀"