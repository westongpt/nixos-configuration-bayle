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

  environment.localBinInPath = true;

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

  programs.zsh.enable = true;
}
