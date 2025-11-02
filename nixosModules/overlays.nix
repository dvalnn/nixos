{ pkgs, inputs, ... }:
let
  # Import stable nixpkgs to use some of its packages
  stable = import (inputs.nixpkgs-stable) {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
{
  nixpkgs.overlays = [

    # Lix package sets
    (final: prev: {
      inherit (prev.lixPackageSets.stable)
        nixpkgs-review
        nix-eval-jobs
        nix-fast-build
        colmena
        ;
    })
  ];

  nix.package = pkgs.lixPackageSets.stable.lix;
}
