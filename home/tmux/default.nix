{pkgs, ...}: {
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
      catppuccin
      vim-tmux-navigator

      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
    ];
  };
}
