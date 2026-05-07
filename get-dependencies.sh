#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm gnu-free-fonts

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano libdecor-mini

echo "Getting app..."
echo "---------------------------------------------------------------"
wget https://archive.org/download/sanicball-archive/Sanicball%20Archive/Game%20versions/Linux/sanicball-v0.8.2-linux.zip
bsdtar -xvf ./sanicball-v0.8.2-linux.zip
rm -f ./*.zip
mkdir -p ./AppDir/bin
mv -v Sanicball_v0.8.2_Data ./AppDir/bin
chmod +x Sanicball_v0.8.2.x86_64
mv -v Sanicball_v0.8.2.x86_64 ./AppDir/bin
