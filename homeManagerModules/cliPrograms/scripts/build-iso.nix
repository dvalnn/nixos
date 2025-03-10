{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "build-iso" ''
    echo "Building ISO"
    pushd ~/nixos/
    nix build .#nixosConfigurations.iso.config.system.build.isoImage
    popd
    '')
  ];
}
