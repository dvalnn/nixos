{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellScriptBin "rebuild"
      ''
        set -e
        pushd ~/nixos/
        nvim .
        alejandra . &>/dev/null
        git diff -U0 *.nix
        echo "NixOS Rebuilding..."
        nh rebuild switch --ask &>nixos-switch.log || (
        cat nixos-switch.log | grep --color error && false)
        gen=$(nixos-rebuild list-generations | grep current)
        git commit -am "$gen"
        popd
      '')
  ];
}
