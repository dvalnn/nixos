{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #network management
    networkmanagerapplet

    # feup l2tp vpn
    networkmanager_strongswan
    networkmanager-l2tp
    xl2tpd

    # other Cli tools
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
    gh

    # GUI apps
    firefox
    vesktop # alternative discord client
    stremio
    obsidian
    vscode-fhs
    spotify
    google-chrome
    mendeley # for master's thesis
    drawio
    postman
    wireshark

    # remote desktop
    rustdesk
  ];
}
