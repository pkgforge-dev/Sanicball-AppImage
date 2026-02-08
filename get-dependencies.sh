#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
#pacman -Syu --noconfirm PACKAGENAME

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here

wget https://archive.org/download/sanicball-archive/Sanicball%20Archive/Game%20versions/Linux/sanicball-v0.8.2-linux.zip
bsdtar -xvf ./sanicball-v0.8.2-linux.zip
rm -f *.zip
mkdir -p ./AppDir/bin
mv -v Sanicball_v0.8.2_Data ./AppDir/bin
chmod +x Sanicball_v0.8.2.x86_64
mv -v Sanicball_v0.8.2.x86_64 ./AppDir/bin
