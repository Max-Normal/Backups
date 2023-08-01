#!/usr/bin/env bash


# Install script for PiJulius Picom

git clone https://github.com/pijulius/picom.git
cd ~/backups/picom && $ git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
ninja -C build install
