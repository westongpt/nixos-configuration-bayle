{ config, pkgs, ... }:

{
  imports = [
    inputs.dms.homeModules.dankMaterialShell.default
    inputs.dms.homeModules.dankMaterialShell.niri
  ];

  home = {
    username = "weston";
    homeDirectory = "/home/weston";
  };

  services.mako = {
    enable = true;
    settings = {
      border-radius = 15;
      max-icon-size = 48;
      padding = "12,12";
    };
  };

  services.polkit-gnome.enable = true; # polkit
  services.swayidle.enable = true; # idle daemon
  programs.swaylock.package = pkgs.swaylock-effects;
  programs.swaylock.enable = true;

  proigrams.dankMaterialShell = {
    enable = true;
    niri.enableSpawn = true;
  }

  programs.git = {
    enable = true;
    settings = {
      user.name = "Weston Hanners";
      user.email = "weston@hanners.us";
      init.defaultBranch = "main";
    };    
  };

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
      obsidian
      plexamp
      nerd-fonts.iosevka
      calibre
      protonup-qt
      superfile
      protontricks
      rsync
      yazi
      element-desktop
      wiremix
      ];

  home.stateVersion = "25.11";
}
