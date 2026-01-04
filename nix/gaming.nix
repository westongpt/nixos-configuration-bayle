{
  pkgs,
  ...
}:

let
  gamescope-git = pkgs.callPackage ./gamescope.nix { };
in
{
  environment.systemPackages = with pkgs; [
    protonup-qt
    cabextract # Needed for ^

    wineWowPackages.full
    winetricks
    faudio
  ];

  environment.sessionVariables = {
    # Default 64-bit Wine prefix for modern games
    WINEPREFIX = "$HOME/.wine";
    WINEARCH = "win64";
  };

  services.system76-scheduler.enable = true;

  programs = {
    gamescope = {
      enable = true;
      package = gamescope-git;
      capSysNice = true;
   };
    gamemode.enable = true;
    steam = {
      enable = true;
      localNetworkGameTransfers.openFirewall = true;
      protontricks.enable = true;
      gamescopeSession = {
        enable = true;
        steamArgs = [
          "-pipewire-dmabuf"
        ];
      };
      package = pkgs.steam.override {
        extraPkgs = p: [
          p.kdePackages.breeze
        ];
      };
      extest.enable = true;
      extraCompatPackages = [
        pkgs.steamtinkerlaunch
        pkgs.proton-ge-bin
      ];
    };
  };
}
