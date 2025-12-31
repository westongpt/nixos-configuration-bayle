{
  description = "Bayle flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    catppuccin.url = "github:catppuccin/nix/release-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "home-manager";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, catppuccin, home-manager, ... }@inputs: {
    nixosConfigurations.bayle = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit self inputs; };
        modules = [ 
          catppuccin.nixosModules.catppuccin
          ./configuration.nix 

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.weston.imports = [
              catppuccin.homeModules.catppuccin
              ./home.nix
            ];
          }
        ];
    };
  };
}
