{pkgs, ...}: {
  home.packages = with pkgs; [
    #network management
    networkmanagerapplet

    # screenshot
    flameshot

    # app launcher
    rofi

    # other Cli tools
    alejandra # nix formatter
    fastfetch
    ripgrep
    repgrep
    lazygit
    xclip
    unzip
    btop
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
    yazi
    xfce.thunar
  ];
}
