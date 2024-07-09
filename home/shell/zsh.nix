{...}: {
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
    };
  };
}
