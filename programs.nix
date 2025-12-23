{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
    kdePackages.discover
    kdePackages.dolphin
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
    pkgs.mpv
    clang
    superfile
    ghostty
    rsync
    xwayland-satellite
  ];

  xdg.portal.enable = true;
  programs.niri.enable = true;
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
      user.name = "Weston Hanners";
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
