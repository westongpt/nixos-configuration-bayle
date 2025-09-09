{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "bayle";
    networkmanager.enable = true;
    nat.enable = true; # Allow plex through firewall.
    firewall = {
      enable = true;
      allowedTCPPorts = [ 32400 ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/Indiana/Indianapolis";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  hardware.graphics = {
    enable = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  services.autorandr.enable = true;
  services.printing.enable = true;
  services.openssh.enable = true;
  services.flatpak.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

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
    videoDrivers = ["nvidia"];
    xkb = {
      layout = "us";
      variant = "";
    };
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
    dataDir = "/mnt/storage/plexdata";
  };

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.motd = "CURSE YOUUU BAYLEEEEEE!";

  users.users.weston = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Weston Hanners";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      obsidian
      vivaldi
      vesktop
      vscode
      plexamp
      superfile
      mc
      htop
      calibre
      protonup-qt
      element-desktop
    ];
  };

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

  programs.steam.enable = true;

  programs.git = {
    enable = true;
    config = {
      user.name = "Weston Hanenrs";
      user.email = "weston@hanners.us";
      init.defaultBranch = "main";
    };    
  };

  programs.tmux = {
    enable = true;
    extraConfig = ''
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

  environment.systemPackages = with pkgs; [
    kdePackages.discover
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
    ghostty
    neovim
    rsync
  ];

  system.stateVersion = "25.05";
}
