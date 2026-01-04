{ pkgs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      gamescope = prev.gamescope.overrideAttrs (oldAttrs: rec {
        version = "3.16.2"; 
          src = prev.fetchFromGitHub {
            owner = "ValveSoftware";
            repo = "gamescope";
            rev = "refs/tags/${version}";
            fetchSubmodules = true;
            hash = "sha256-RInyP8MvC68/u5HhLhLidYvX7rS9X9Y4zB8X6Y4zB8=";
          };

          patches = [ ];
        });
     })
  ];
}
