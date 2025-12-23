{ config, pkgs, ... }:

{
  users.motd = "CURSE YOUUU BAYLEEEEEE!";

  users.users.weston = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Weston";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      obsidian
      plexamp
      superfile
      mc
      htop
      calibre
      protonup-qt
      element-desktop
    ];
  };
}
