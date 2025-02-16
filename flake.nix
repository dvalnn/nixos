{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      #FIXME: This is a temporary fix until https://github.com/danth/stylix/issues/865 is resolved
      url = "github:nix-community/home-manager/45c07fcf7d28b5fb3ee189c260dee0a2e4d14317";
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
          ] ++ homeConfig ./homeManagerModules/laptop.nix;
        };

        nix-desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs user;
          };

          modules = [
            lix-module.nixosModules.default
            ./hosts/nix-desktop
          ] ++ homeConfig ./homeManagerModules/desktop.nix;
        };
      };
    };
}
