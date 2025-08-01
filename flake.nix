{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs =
    {
      self,
      nixpkgs,
      lix-module,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;

      user = {
        name = "dvalinn";
        description = "Tiago Amorim";
        email = "tiago.andre.amorim@gmail.com";
        uid = 1000;
      };

      homeConfig = homeConfigPath: [
        ./nixosModules
        inputs.stylix.nixosModules.stylix

        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            extraSpecialArgs = {
              inherit inputs user;
            };

            users.${user.name} = import homeConfigPath;
          };
        }
      ];
    in
    {
      nixosConfigurations = {
        nix-laptop = lib.nixosSystem {
          specialArgs = {
            inherit inputs user;
          };

          modules = [
            lix-module.nixosModules.default
            ./hosts/nix-laptop
          ]
          ++ homeConfig ./homeManagerModules/laptop.nix;
        };

        nix-desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs user;
          };

          modules = [
            lix-module.nixosModules.default
            ./hosts/nix-desktop
          ]
          ++ homeConfig ./homeManagerModules/desktop.nix;
        };
      };
    };
}
