{
  lib,
  config,
  ...
}: {
  options = {
    zsh.enable = lib.mkEnableOption "enable zsh";
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      autocd = true;

      dotDir = ".config/zsh";
      enableCompletion = true;

      autosuggestion = {
        enable = true;
      };

      history = {
        path = "$ZDOTDIR/.zsh_history";
        ignoreAllDups = true;
        ignorePatterns = [
          "ls"
          "pwd"
          "sudo reboot"
          "history"
          "cd *"
          "rm *"
          "pkill *"
        ];
      };

      historySubstringSearch = {
        enable = true;
      };

      syntaxHighlighting = {
        enable = true;
      };

      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";

        c = "clear";

        lg = "lazygit";
        gp = "git push";
        gs = "git status";
        gcam = "git commit -a -m";

        ls = "eza --group-directories-first";
        lsd = "eza -d .* --group-directories-first";

        tree = "eza --tree";
        fetch = "fastfetch";

        cat = "bat";
        xclipc = "xclip -selection c";

        init-c = "nix flake init -t github:nix-community/templates#c";
        init-go = "nix flake init -t github:nix-community/templates#go";
        init-zig = "nix flake init -t github:dvalnn/templates#zig"; # custom fork up-to-date with most recent zig version
        init-rust = "nix flake init -t github:nix-community/templates#rust";
        init-python = "nix flake init -t github:nix-community/templates#python";

        pyrepl = "nix run nixpkgs#python3"; # run python3 repl

        home-log = "sudo journalctl -xeu home-manager-dvalinn.service";
      };
    };
  };
}
