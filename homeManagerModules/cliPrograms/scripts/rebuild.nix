{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellScriptBin "rebuild"
      ''
        set -e
        pushd ~/nixos/
        nvim
        alejandra . &>/dev/null
        git diff -U0 *.nix
        echo "NixOS Rebuilding..."
        nh os switch --ask
        gen=$(nixos-rebuild list-generations | grep current)
        git commit -am "$gen"
        popd
      '')

    (pkgs.writeShellScriptBin "update"
      ''
        function reset_flake {
          pushd ~/nixos/
          git reset --hard
          popd
        }

        trap reset_flake ERR

        echo "NixOS Updating..."
        nh os switch --update --ask
        gen=$(nixos-rebuild list-generations | grep current)
        git commit -am "$gen"
      '')
  ];
}
