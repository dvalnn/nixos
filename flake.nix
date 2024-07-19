{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    user = {
      name = "dvalinn";
      description = "Tiago Amorim";
      email = "tiago.andre.amorim@gmail.com";
    };

    home-manager = inputs.home-manager.nixosModules.home-manager;
    home-manager-opts = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;

      home-manager.extraSpecialArgs = {
        inherit inputs;
        inherit user;
      };
      home-manager.users.${user.name} = import ./homeManagerModules;
    };

    stylix = inputs.stylix.nixosModules.stylix;
  in {
    nixosConfigurations = {
      nix-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit user;
        };
        modules = [
          ./hosts/nix-laptop
          home-manager
          home-manager-opts
          stylix
        ];
      };

      nix-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit user;
        };
        modules = [
          ./hosts/nix-desktop
          ./nixosModules
          home-manager
          home-manager-opts
          stylix
        ];
      };
    };
  };
}
