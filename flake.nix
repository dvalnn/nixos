{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... } @ inputs: {
		nixosConfigurations = {

			default = nixpkgs.lib.nixosSystem {

				specialArgs = {inherit inputs;};
				modules = [
					# Not specifying the file, makes nix search for a default.nix
					# in this case ./hosts/default/default.nix must be present
					./hosts/default

					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;

						home-manager.extraSpecialArgs = inputs;
						# same as above. ./home/default.nix must be present
						home-manager.users.dvalinn = import ./home/default.nix;

					}
				];

			};

		};
	};
}
