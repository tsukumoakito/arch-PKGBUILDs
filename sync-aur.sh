#!/usr/bin/env bash
# SPDX-License-Identifier: 0BSD
# SPDX-FileCopyrightText: 2026 TSUKUMO Akito <tsukumoakito99@duck.com>

PKG_NAME=$1

if [ -z "$PKG_NAME" ] || [ ! -d "$PKG_NAME" ]; then
    echo "Usage: ./sync-aur.sh [package_directory]"
    exit 1
fi

AUR_REMOTE="ssh://aur@aur.archlinux.org/$PKG_NAME.git"
WORK_DIR="/tmp/aur-sync-$PKG_NAME"

echo ">>> Processing: $PKG_NAME"

cd "$PKG_NAME" || exit
makepkg --config ../private/.makepkg.conf --printsrcinfo >.SRCINFO
cd ..

rm -rf "$WORK_DIR"
git clone "$AUR_REMOTE" "$WORK_DIR"

find "$WORK_DIR" -maxdepth 1 -not -name '.git' -not -name "$WORK_DIR" -exec rm -rf {} +
cp -r "$PKG_NAME"/. "$WORK_DIR/"

find "$WORK_DIR" -type f \( -name "*.pkg.tar.zst" -o -name "*.tar.gz" -o -name "*.sig" \) -delete

cd "$WORK_DIR" || exit
git add -A
if git diff --cached --quiet; then
    echo ">>> No changes to commit for $PKG_NAME"
else
    PKG_VER=$(grep -m 1 "pkgver =" .SRCINFO | cut -d' ' -f3)
    git commit -m "upstream update to $PKG_VER"
    git push origin master
    echo ">>> Successfully synced $PKG_NAME to AUR."
fi

rm -rf "$WORK_DIR"
