{ config, pkgs, ... }:

{
  users.motd = "CURSE YOUUU BAYLEEEEEE!";

  users.users.weston = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Weston Hanners";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      obsidian
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
}