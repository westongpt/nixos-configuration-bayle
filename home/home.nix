{ config, inputs, pkgs, ... }:

{
  home = {
    username = "weston";
    homeDirectory = "/home/weston";
  };

  services.mako = {
    enable = true;
    settings = {
      default-timeout = 5000;
      border-radius = 15;
      max-icon-size = 48;
      padding = "12,12";
    };
  };

  services.polkit-gnome.enable = true; # polkit
  programs.swaylock.package = pkgs.swaylock-effects;
  programs.swaylock.enable = true;

  # programs.dankMaterialShell.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user.name = "Weston Hanners";
      user.email = "weston@hanners.us";
      init.defaultBranch = "main";
    };    
  };

  home.packages = with pkgs; [
      kdePackages.kirigami.unwrapped
      kdePackages.qtdeclarative
      kdePackages.sonnet
      swayidle
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
      stow
      yazi
      element-desktop
      wiremix
      ];

    # home.sessionVariables.QML2_IMPORT_PATH = pkgs.lib.concatStringsSep ":" [
    #   "${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml"
    #   "${pkgs.kdePackages.kirigami.unwrapped}/lib/qt-6/qml"
    # ];

  home.stateVersion = "25.11";
}
