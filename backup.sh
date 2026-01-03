#!/usr/bin/env bash

# Back up the nix config.
cp /etc/nixos/*.nix .

# Back up the flake.lock.
cp /etc/nixos/flake.lock .
