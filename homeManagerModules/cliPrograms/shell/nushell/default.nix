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

      ".config/nushell/scripts" = {
        source = ./scripts;
        recursive = true;
      };
    };

    programs.nushell = {
      enable = true;
      configFile.source = ./config.nu;

      plugins = with pkgs.nushellPlugins; [
        gstat
      ];

      extraConfig =
        with pkgs.nushellPlugins; # nu
        ''
          $env.Path = ($env.Path | append ${gstat}/bin);
        '';

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

        py = "nix run nixpkgs#python3"; # run python3 repl

        home-log = "sudo journalctl -xeu home-manager-dvalinn.service";
      };
    };
  };
}
