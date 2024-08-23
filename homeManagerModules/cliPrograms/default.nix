{
  lib,
  config,
  ...
}: {
  imports = [
    # shells
    ./zsh.nix
    ./ohMyPosh

    # terminals
    ./alacritty.nix

    # editors
    ./nvim
    ./helix.nix

    # terminal multiplexers
    ./tmux

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

    nvim.enable = lib.mkDefault true;

    tmux.enable = lib.mkDefault true;

    fzf.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    direnv.enable = lib.mkDefault true;
    zoxide.enable = lib.mkDefault true;
  };
}
