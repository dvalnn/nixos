{pkgs, ...}: {
  home.packages = with pkgs; [
    #network management
    networkmanagerapplet

    # screenshot
    flameshot

    # dev tools
    alejandra
    lazygit
    podman
    podman-tui

    # terminal file manager
    ranger

    # other Cli tools
    fastfetch
    ripgrep
    repgrep
    xclip
    unzip
    gotop
    less
    dust
    bat
    eza
    fzf
    jq
    fd
    gh # github cli

    # GUI apps
    firefox
    discord
    spotify

    # File management
    xfce.thunar
  ];
}
