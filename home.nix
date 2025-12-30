{ config, pkgs, ... }:

{
  home.username = "weston";
  home.homeDirectory = "/home/weston";

  services.mako.enable = true; # notification daemon
  services.polkit-gnome.enable = true; # polkit

  home.packages = with pkgs; [
    alacritty
    fuzzel
    swaybg
    wget
    xdotool
    blender
    godot
    krita
    unzip
    ripgrep
    xxd
    fastfetch
    yad
    btop
    xwininfo
    ranger

  ];

  home.stateVersion = "25.11";
}
