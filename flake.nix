{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;

        extraSpecialArgs = {
          inherit inputs;
          inherit user;
        };

        users.${user.name} = import ./homeManagerModules;
      };
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
