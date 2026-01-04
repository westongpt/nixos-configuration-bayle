#!/usr/bin/env bash

echo Installing configuration...
sudo cp ./*.nix /etc/nixos
sudo cp -R ./nix /etc/nixos
sudo cp -R ./home /etc/nixos
sudo cp flake.lock /etc/nixos

echo Building...
pushd /etc/nixos/
sudo nixos-rebuild switch --flake .
popd
echo Retrieving lockfile...
sudo cp /etc/nixos/flake.lock ./

echo Done!
