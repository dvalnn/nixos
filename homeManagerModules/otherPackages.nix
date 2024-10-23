{pkgs, ...}: {
  home.packages = with pkgs; [
    # TODO: extract this into dedicated config
    kitty

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
    vesktop # alternative discord client
    stremio
    obsidian
    vscode-fhs
    spotify
    google-chrome

    # File management
    yazi
    xfce.thunar
  ];
}
