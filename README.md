<!--
SPDX-License-Identifier: 0BSD
SPDX-FileCopyrightText: 2026 TSUKUMO Akito <tsukumoakito99@duck.com>
-->

# arch-PKGBUILDs

This repository is a collection of PKGBUILDs for my projects, managed by TSUKUMO Akito. It serves as the staging area before syncing with the [AUR (Arch User Repository)](https://aur.archlinux.org/).

## Available Packages

| Package | Version | Description | AUR Link |
| :--- | :--- | :--- | :--- |
| **zind** | 1.0.0-2 | Dynamic structural API indexer for Zig | [zind](https://aur.archlinux.org/packages/zind) |

## Maintenance Workflow

1. Update `pkgver` or `pkgrel` in the package's `PKGBUILD`.
2. Run `updpkgsums` to update source checksums.
3. Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`.
4. Verify the build with `makepkg -s`.
5. Run `./sync-aur.sh <package_name>` to deploy to AUR.

## License

The PKGBUILD scripts and configurations in this repository are licensed under the [0BSD License](./LICENSE), following the Arch Linux RFC 40 package guidelines.

Note that the individual software packages being built remain subject to their own respective upstream licenses (e.g., Zind is AGPL-3.0).
