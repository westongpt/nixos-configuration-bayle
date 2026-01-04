{
  description = "Bayle flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    qml-niri = {
      url = "github:imiric/qml-niri/main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };

  };

  outputs = inputs@{ self, nixpkgs, stylix, home-manager, ... }: {
    nixosConfigurations.bayle = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit self inputs; };
      modules = [
      stylix.nixosModules.stylix
      ./nix/configuration.nix 
      home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.weston.imports = [
            ./home/home.nix
          ];
      }
      ];
      };
    };
  }
