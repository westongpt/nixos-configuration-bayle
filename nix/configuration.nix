{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./system.nix
    ./programs.nix
    ./specific/nvidia.nix
    ./specific/gaming.nix
    ./specific/obs.nix
    ./specific/stylix.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings.download-buffer-size = 524288000;
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
