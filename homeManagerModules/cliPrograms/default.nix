{
  lib,
  config,
  ...
}:
{
  imports = [
    # shell configuration
    ./shell/zsh.nix
    ./shell/ohMyPosh
    ./shell/nushell

    ./shell/direnv.nix
    ./shell/zoxide.nix
    ./shell/eza.nix
    ./shell/fzf.nix

    # terminals
    ./alacritty.nix
    ./kitty.nix

    # editors
    ./neovim
    ./helix.nix

    # terminal multiplexers
    ./tmux
    ./zellij

    ./git.nix

    # custom scripts
    ./scripts/rebuild.nix
    ./scripts/update.nix
  ];

  options = {
    cliPrograms.enable = lib.mkEnableOption "enable various cli programs and tools";
  };

  config = lib.mkIf config.cliPrograms.enable {
    zsh.enable = lib.mkDefault false;
    ohMyPosh.enable = lib.mkDefault false;

    nushell.enable = lib.mkDefault true;
    direnv.enable = lib.mkDefault true;
    zoxide.enable = lib.mkDefault true;
    eza.enable = lib.mkDefault true;
    fzf.enable = lib.mkDefault false;

    alacritty.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault false;

    nvim.enable = lib.mkDefault true;

    tmux.enable = lib.mkDefault true;
    zellij.enable = lib.mkDefault false;

    git.enable = lib.mkDefault true;
  };
}
