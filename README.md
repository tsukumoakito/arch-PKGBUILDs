<!--
SPDX-FileCopyrightText: 2026 TSUKUMO Akito <tsukumoakito99@duck.com>
SPDX-License-Identifier: MIT
-->

<p align="center">
  <img src="doc/arch-pkgbuilds_logo.svg" width="100%" alt="arch-PKGBUILDs Logo">
</p>

# arch-PKGBUILDs

This repository is a collection of PKGBUILDs for my projects, managed by TSUKUMO Akito. It serves as the staging area before syncing with the [AUR (Arch User Repository)](https://aur.archlinux.org/).

## Available Packages

| Package | Version | Description | Votes | Links |
| :--- | :--- | :--- | :--- | :--- |
| **zind** | ![AUR version](https://img.shields.io/aur/version/zind) | Dynamic structural API indexer for Zig | ![AUR votes](https://img.shields.io/aur/votes/zind) | [![AUR](https://img.shields.io/badge/AUR-Package-orange)](https://aur.archlinux.org/packages/zind) [![License](https://img.shields.io/aur/license/zind)](./zind/LICENSE) |

## Maintenance Workflow

1. Update `pkgver` or `pkgrel` in the package's `PKGBUILD`.
2. Run `updpkgsums` to update source checksums.
3. Regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`.
4. Verify the build with `makepkg -s`.
5. Run `./sync-aur.sh <package_name>` to deploy to AUR.

## License

The PKGBUILD scripts in this repository are licensed under the [0BSD License](./LICENSES/0BSD.txt), following the Arch Linux RFC 40 package guidelines.

The configurations in this repository are licensed under the [MIT License](./LICENSE).

Note that the individual software packages being built remain subject to their own respective upstream licenses (e.g., Zind is AGPL-3.0).
