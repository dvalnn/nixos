{
  lib,
  config,
  ...
}:
{
  imports = [
    # shells
    ./zsh.nix
    ./ohMyPosh

    # terminals
    ./alacritty.nix
    ./kitty.nix

    # editors
    ./neovim
    ./helix.nix

    # terminal multiplexers
    ./tmux
    ./zellij

    # tools
    ./git.nix
    ./direnv.nix
    ./fzf.nix
    ./zoxide.nix

    # custom scripts
    ./scripts/rebuild.nix
    ./scripts/update.nix
  ];

  options = {
    cliPrograms.enable = lib.mkEnableOption "enable various cli programs and tools";
  };

  config = lib.mkIf config.cliPrograms.enable {
    zsh.enable = lib.mkDefault true;
    ohMyPosh.enable = lib.mkDefault true;

    alacritty.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault false;

    nvim.enable = lib.mkDefault true;

    tmux.enable = lib.mkDefault true;
    zellij.enable = lib.mkDefault false;

    fzf.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    direnv.enable = lib.mkDefault true;
    zoxide.enable = lib.mkDefault true;
  };
}
