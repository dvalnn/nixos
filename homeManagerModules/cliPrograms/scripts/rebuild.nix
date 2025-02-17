{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "rebuild" ''
      set -e
      pushd ~/nixos/
      nvim
      git add .
      git diff -U0 *.nix
      echo "NixOS Rebuilding..."
      nh os switch --ask
      gen=$(nixos-rebuild list-generations | grep current)
      git commit -am "$gen"
      popd
    '')
  ];
}
