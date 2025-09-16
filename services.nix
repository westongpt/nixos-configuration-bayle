{ config, pkgs, ... }:

{
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
    user = "weston";
    dataDir = "/mnt/storage/plexdata";
  };

  services.samba = {
  enable = true;
  securityType = "user";
  openFirewall = true;
  settings = {
    global = {
      "workgroup" = "WORKGROUP";
      "server string" = "bayle";
      "netbios name" = "bayle";
      "security" = "user";
      "guest account" = "nobody";
      "map to guest" = "bad user";
    };
    "public" = {
      "path" = "/mnt/plex/";
      "browseable" = "yes";
      "read only" = "no";
      "guest ok" = "yes";
      "create mask" = "0644";
      "directory mask" = "0755";
      "force user" = "weston";
      "force group" = "users";
    };
  };
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
}
