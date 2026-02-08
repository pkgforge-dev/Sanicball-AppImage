#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=0.8.2
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export DEPLOY_OPENGL=1
export DEPLOY_SDL=1

# Deploy dependencies
quick-sharun ./AppDir/bin/Sanicball_v0.8.2.x86_64
# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
