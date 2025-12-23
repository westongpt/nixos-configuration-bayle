{ config, pkgs, ... }:

{
  home.username = "weston";
  home.homeDirectory = "/home/weston";

  programs.swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
  services.mako.enable = true; # notification daemon
  services.swayidle.enable = true; # idle management daemon
  services.polkit-gnome.enable = true; # polkit

  home.packages = with pkgs; [
    alacritty
    fuzzel
    swaybg
    steamtinkerlaunch
    wget
    xdotool
    blender
    godot
    krita
    unzip
    ripgrep
    xxd
    yad
    xwininfo
  ];

  home.stateVersion = "25.11";
}
