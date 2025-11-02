{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

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
            ./hosts/nix-laptop
          ]
          ++ homeConfig ./homeManagerModules/laptop.nix;
        };

        nix-desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs user;
          };

          modules = [
            ./hosts/nix-desktop
          ]
          ++ homeConfig ./homeManagerModules/desktop.nix;
        };
      };
    };
}
