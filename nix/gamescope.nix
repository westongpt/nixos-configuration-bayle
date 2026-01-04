{ pkgs, ... }:

let
  customGamescope = pkgs.gamescope.overrideAttrs (oldAttrs: {
    pname = "gamescope";
    version = "3.16.2";
    src = pkgs.fetchFromGitHub {
      owner = "ValveSoftware";
      repo = "gamescope";
      rev = "3.16.2";
      fetchSubmodules = true;
      hash = "sha256-RInyP8MvC68/u5HhLhLidYvX7rS9X9Y4zB8X6Y4zB8=";
    };
    patches = [ ];
  });
in
{
  programs.gamescope = {
    enable = true;
    package = customGamescope;
  };
}
