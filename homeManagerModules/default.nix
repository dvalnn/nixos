{pkgs, user, ...}: {
  imports = [
    ./windowManagers
    ./nvim
    ./helix
    ./shell
    ./tmux
  ];

  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";

  awesomeWM.enable = true;

  home.packages = with pkgs; [
    # misc packages
    libnotify
    flameshot

    # dev tools
    python3
    alejandra
    podman
    podman-tui

    # Cli tools
    fastfetch
    ripgrep
    repgrep
    xclip
    unzip
    less
    dust
    bat
    eza
    fzf
    jq
    fd
    gh

    # TUI apps
    gotop
    lazygit

    # GUI apps
    firefox
    discord
    spotify

    # File management
    xfce.thunar

    #scripts
    (pkgs.writeShellScriptBin "rebuild"
      ''${builtins.readFile ./scripts/rebuild.sh}'')
  ];

  home.sessionVariables = {
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    git = {
      enable = true;
      userName = user.name;
      userEmail = user.email;
    };

    ranger = {
      enable = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}

