{
  lib,
  config,
  ...
}:
{
  options = {
    fzf.enable = lib.mkEnableOption "enable fzf (with zsh integration)";
  };

  config = lib.mkIf config.fzf.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = if config.zsh.enable then true else false;
      tmux = {
        enableShellIntegration = if config.tmux.enable then true else false;
        shellIntegrationOptions = [
          "-p" # run in popup mode
        ]; # see fzf-tmux --help for available options
      };
    };
  };
}
