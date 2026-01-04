{
  gamescope,
  fetchFromGitHub,
}:
# To update.
# nix-prefetch-github ValveSoftware gamescope --fetch-submodules
let
  rev = "221394fedaed213f9bce6d18f60242e3120b661f";
  hash = "sha256-0Kg3J35I3zj8KYw+to51VBDo4Zb19pI6ISrseBOwO1k=";
in
gamescope.overrideAttrs (old: {
  version = "unstable-20251206105151-9416ca";
  NIX_CFLAGS_COMPILE = [ "-fno-fast-math" ];

  src = fetchFromGitHub {
    inherit rev hash;
    owner = "ValveSoftware";
    repo = "gamescope";
    fetchSubmodules = true;
  };

  # Unsure if this bit is necessary, though I guess it's nice to have the version gamescope shows match
  postPatch = (old.postPatch or "") + ''
    substituteInPlace src/meson.build \
      --replace-fail "'git', 'describe', '--always', '--tags', '--dirty=+'" "'echo', '${rev}'"

    patchShebangs default_extras_install.sh
  '';
})
