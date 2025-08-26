#!/bin/bash
export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_CONFIG_HOME"/nixpkgs

# Symlink configs
ln -sf "$PWD"/nixpkgs/config.nix "$XDG_CONFIG_HOME"/nixpkgs/config.nix
ln -sf "$PWD"/config/nvim "$XDG_CONFIG_HOME"/nvim
ln -sf "$PWD"/config/zsh/.zshrc ~/.zshrc
source ~/.zshrc

# Install Nix packages from config.nix
nix-env -iA nixpkgs.myPackages
