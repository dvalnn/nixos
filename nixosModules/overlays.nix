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

    (final: prev: {
      # Pin the entire GNOME namespace to stable
      gnome = stable.gnome;

      # Common top-level GNOME components that are used outside gnome.*
      gnome-shell = stable.gnome-shell;
      mutter = stable.mutter;
      gsettings-desktop-schemas = stable.gsettings-desktop-schemas;
      gnome-control-center = stable.gnome-control-center;
      gnome-backgrounds = stable.gnome-backgrounds;
      gnome-tweaks = stable.gnome-tweaks;
      gnome-shell-extensions = stable.gnome-shell-extensions;
      qgnomeplatform = stable.qgnomeplatform;

      adwaita-icon-theme = stable.adwaita-icon-theme;

      # Optional: a few libraries GNOME components depend on, to ensure ABI consistency
      libadwaita = stable.libadwaita;
      libgweather = stable.libgweather;
      evolution-data-server = stable.evolution-data-server;
    })
  ];

  nix.package = pkgs.lixPackageSets.stable.lix;
}
