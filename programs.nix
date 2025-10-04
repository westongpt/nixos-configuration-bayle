{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.easyeffects
    pkgs.piper
    pkgs.libratbag
    kdePackages.discover
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.kclock
    kdePackages.kcolorchooser
    kdePackages.kolourpaint
    kdePackages.ksystemlog
    kdePackages.sddm-kcm
    kdiff3
    kdePackages.isoimagewriter
    kdePackages.partitionmanager
    wayland-utils
    wl-clipboard
    ghostty
    neovim
    rsync
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Fix for steam missing mouse cursors.
  programs.steam.package = pkgs.steam.override {
    extraPkgs = p: [
      p.kdePackages.breeze
    ];
  };

  programs.steam.enable = true;

  programs.git = {
    enable = true;
    config = {
      user.name = "Weston Hanenrs";
      user.email = "weston@hanners.us";
      init.defaultBranch = "main";
    };    
  };

  programs.tmux = {
    enable = true;
    extraConfig = 
    ''
      set -g mouse on
      set -g default-terminal "screen-256color"
    '';
  };

  programs.zsh.enable = true;

  programs.nano.nanorc = 
  ''
    set tabstospaces
    set tabsize 2
    set linenumbers
    set mouse
  '';
}