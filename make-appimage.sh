#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=0.8.2
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://camo.githubusercontent.com/df42906122fab225f355a3f15e992e0546859c2570a42a6a97aeef07466abf1e/68747470733a2f2f7374617469632e77696b69612e6e6f636f6f6b69652e6e65742f73616e69632d62616c6c2f696d616765732f342f34642f53616e69632e706e672f7265766973696f6e2f6c61746573743f63623d3230313630393031323035303330
export DESKTOP=DUMMY

# Deploy dependencies
quick-sharun /usr/bin/*
# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
