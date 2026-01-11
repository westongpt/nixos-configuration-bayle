{ pkgs, inputs, ... }:

let
  unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
in
{
  environment.systemPackages = with pkgs; [
    protonup-qt
    cabextract # Needed for ^
    joystickwake
    wineWowPackages.full
    winetricks
    faudio
  ];

  # Prevent sleep while gaming.
  systemd.user.services.joystickwake = {
    description = "Joystick-aware screen waker";
    after = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.joystickwake}/bin/joystickwake";
      Restart = "always";
    };
  };

  environment.sessionVariables = {
    # Default 64-bit Wine prefix for modern games
    WINEPREFIX = "$HOME/.wine";
    WINEARCH = "win64";
  };

  services.system76-scheduler.enable = true;
  
  programs = {
    gamescope = {
      enable = true;
    };
    gamemode.enable = true;
    steam = {
      enable = true;
      localNetworkGameTransfers.openFirewall = true;
      protontricks.enable = true;
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
