{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "update" ''
      function reset_flake {
        pushd ~/nixos/
        git reset --hard
        popd
      }

      trap reset_flake ERR

      echo "NixOS Updating..."
      nh os switch --update --ask

      pushd ~/nixos/
      gen=$(nixos-rebuild list-generations | grep current)
      git commit -am "$gen"
      popd
    '')
  ];
}
