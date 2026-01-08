{
  config,
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
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
    pkgs.dart
    (pkgs.sddm-astronaut.override { embeddedTheme = "black_hole"; })
  ];

  security.pam.services.swaylock = { };

  services.autorandr.enable = true;
  services.printing.enable = true;
  services.openssh.enable = true;
  services.openssh.allowSFTP = true;
  services.flatpak.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.hardware.openrgb.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
      workstation = true;
    };
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  programs.niri.enable = true;
  programs.xfconf.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config = {
      common.default = [ "gnome" ];
    };
  };

  services.desktopManager = {
    plasma6.enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    extraPackages = [ pkgs.sddm-astronaut ];
  };

  services.syncthing = {
    enable = true;
    user = "weston";
    dataDir = "/home/weston/Sync";
    configDir = "/home/weston/.syncthing";
  };

  services.plex = {
    enable = true;
    openFirewall = true;
    user = "weston";
    dataDir = "/mnt/games/plexdata";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.zsh.enable = true;
}
