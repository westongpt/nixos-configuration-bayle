{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
      inputs.quickshell.packages.${stdenv.hostPlatform.system}.default
      inputs.qml-niri.packages.${stdenv.hostPlatform.system}.default
      kdePackages.discover
      kdePackages.dolphin
      kdePackages.isoimagewriter
      kdePackages.partitionmanager
      kdePackages.plasma-workspace
      wayland-utils
      wl-clipboard
      pkgs.mpv
      ghostty
      pkgs.openrgb
      clang
      pciutils
      xwayland-satellite
      vulkan-tools
      snixembed
      (pkgs.sddm-astronaut.override { embeddedTheme = "jake_the_dog"; })
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
    ];
    config = {
      common.default = ["gtk"];
    };
  };

  programs.niri.enable = true;
  programs.xfconf.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.steam = {
    enable = true;
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
