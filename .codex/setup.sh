#!/usr/bin/env bash
set -euo pipefail

# Minimal dependency installation for CI and local dev
sudo apt-get update
sudo apt-get install -y build-essential clang clang-tidy llvm lld \
    qemu-system-x86 qemu-utils ninja-build meson python3 python3-pip

# Ensure meson is available via pip if apt version fails
if ! command -v meson >/dev/null; then
    pip3 install --user meson
fi
