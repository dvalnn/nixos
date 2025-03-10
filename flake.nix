{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
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

        iso = lib.nixosSystem {
          modules = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome-nix"
            "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
            lix-module.nixosModules.default
            ./hosts/iso
          ] ++ homeConfig ./homeManagerModules/iso.nix;

          specialArgs = {
            inherit inputs user;
          };
        };
      };
    };
}
