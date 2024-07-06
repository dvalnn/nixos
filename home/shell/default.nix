{...} : 
{
  imports = [
    ./terminals.nix
  ];

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
    };

    historySubstringSearch = {
      enable = true;
    };

    syntaxHighlighting = {
      enable = true;
    };
       
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromTOML (builtins.readFile ./oh-my-posh.toml);
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
