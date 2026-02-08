{
  config,
  inputs,
  pkgs,
  ...
}:

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
  programs.waybar.enable = true;
  programs.yt-dlp.enable = true;
  programs.bat.enable = true;

  programs.beets = {
    enable = true;
    settings = {
      directory = "/mnt/plex/Music/";
      library = "~/Music/Beets";
      import = {
        move = true;
      };
      embedart = {
        ifempty = false;
      };
      fetchart = {
        cautious = true;
        minwidth = 400;
      };
      plugins = "musicbrainz fetchart embedart";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Weston Hanners";
      user.email = "weston@hanners.us";
      init.defaultBranch = "main";
    };
  };

  stylix.targets = {
    waybar.enable = false;
  };

  home.packages = with pkgs; [
    kdePackages.kirigami.unwrapped
    kdePackages.qtdeclarative
    kdePackages.sonnet
    pkgs.zed-editor
    pkgs.libnotify
    swayidle
    jq
    alacritty
    fuzzel
    swaybg
    mc
    wget
    xdotool
    blender
    godot
    krita
    unzip
    ripgrep
    xxd
    tmux
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
    vesktop
  ];
  home.stateVersion = "25.11";
}
