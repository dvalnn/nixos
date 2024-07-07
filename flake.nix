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

  outputs = { self, nixpkgs, ... } @ inputs: {
    nixosConfigurations = 
    let mods = [
      ./hosts/nix-laptop

      inputs.stylix.nixosModules.stylix

      inputs.home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;

        home-manager.extraSpecialArgs = inputs;
        home-manager.users.dvalinn = import ./home/default.nix;
      } ];

    in {
      nix-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = mods;
      };

      nix-desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = mods;
      };
    };
  };
}
