{pkgs, ...}: {
  home.packages = with pkgs; [
    #network management
    networkmanagerapplet

    # feup l2tp vpn
    networkmanager_strongswan
    networkmanager-l2tp
    xl2tpd

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

    # GUI apps
    firefox
    vesktop # alternative discord client
    stremio
    obsidian
    vscode-fhs
    spotify
    google-chrome
    mendeley # for master's thesis
  ];
}
