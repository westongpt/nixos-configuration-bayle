{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
    kdePackages.discover
    kdePackages.dolphin
    kdePackages.isoimagewriter
    kdePackages.partitionmanager
    kdePackages.plasma-workspace
    wayland-utils
    wl-clipboard
    pkgs.mpv
    pkgs.openrgb
    clang
    superfile
    ghostty
    protontricks
    rsync
    pciutils
    xwayland-satellite
    vulkan-tools
    snixembed
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

  programs.gamescope = {
    enable = true;
#    capSysNice = true;
  };
  
  programs.steam = {
    enable = true;
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
}
