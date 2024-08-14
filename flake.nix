{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixosStable.url = "github:nixos/nixpkgs/nixos-24.05";

    stylix.url = "github:danth/stylix";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Wayland widgets lib
    ags.url = "github:Aylur/ags";
    swww.url = "github:LGFae/swww";
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

    commonModules = homeConfigPath: [
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
  in {
    nixosConfigurations = {
      nix-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs user;
        };
        modules =
          [
            ./hosts/nix-laptop
          ]
          ++ commonModules ./homeManagerModules/laptop.nix;
      };

      nix-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs user;
        };
        modules =
          [
            ./hosts/nix-desktop
          ]
          ++ commonModules ./homeManagerModules/desktop.nix;
      };
    };
  };
}
