{
  lib,
  pkgs,
  config,
  ...
}:
{
  options = {
    nushell.enable = lib.mkEnableOption "enable nushell";
  };

  config = lib.mkIf config.nushell.enable {
    services.pueue.enable = true; # for background jobs in nushell

    home.file = {
      ".config/nushell/modules" = {
        source = ./modules;
        recursive = true;
      };
    };

    programs.nushell = {
      enable = true;
      configFile.source = ./config.nu;

      plugins = with pkgs.nushellPlugins; [
        skim
        gstat
      ];

      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";

        c = "clear";

        lg = "lazygit";
        gp = "git push";
        gs = "git status";
        gcam = "git commit -a -m";

        tree = "eza --tree";
        fetch = "fastfetch";

        xclipc = "xclip -selection c";

        init-c = "nix flake init -t github:nix-community/templates#c";
        init-go = "nix flake init -t github:nix-community/templates#go";
        init-zig = "nix flake init -t github:dvalnn/templates#zig"; # custom fork up-to-date with most recent zig version
        init-rust = "nix flake init -t github:nix-community/templates#rust";
        init-python = "nix flake init -t github:nix-community/templates#python";

        py = "nix run nixpkgs#python3"; # run python3 repl

        home-log = "sudo journalctl -xeu home-manager-dvalinn.service";
      };
    };
  };
}
