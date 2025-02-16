{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    tmux.enable = lib.mkEnableOption "enable tmux";
  };

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      mouse = true;
      historyLimit = 10000;
      disableConfirmationPrompt = true;

      extraConfig = ''${builtins.readFile ./tmux.conf}'';

      plugins = with pkgs.tmuxPlugins; [
        yank
        sensible
        continuum
        # catppuccin
        gruvbox
        vim-tmux-navigator

        # {
        #   plugin = resurrect;
        #   extraConfig = "set -g @resurrect-strategy-nvim 'session'";
        # }
      ];
    };
  };
}
