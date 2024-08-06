{pkgs, ...}: {
  home.packages = with pkgs; [
    #network management
    networkmanagerapplet

    # screenshot
    flameshot

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
    jq
    fd
    gh # github cli

    # GUI apps
    firefox
    google-chrome # sometimes its usefull
    vesktop # alternative discord client
    spotify

    # File management
    yazi
    xfce.thunar
  ];
}
