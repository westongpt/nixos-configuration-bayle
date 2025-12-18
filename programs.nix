{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.easyeffects
    pkgs.piper
    pkgs.libratbag
    inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
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
    xwayland-satellite
    protontricks
  ];

  programs.niri.enable = true;
  programs.thunar.enable = true;
  programs.xfconf.enable = true;

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

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

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
