{...} : 
{
  imports = [
    ./terminals.nix
    ./zsh.nix
  ];

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
