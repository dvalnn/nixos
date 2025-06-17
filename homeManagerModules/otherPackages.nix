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
    jq
    fd
    gh

    # Browsers
    firefox
    google-chrome

    # GUI apps
    vesktop # alternative discord client
    stremio
    # obsidian
    # vscode-fhs
    spotify
    mendeley # for master's thesis
    drawio
    # postman
    # wireshark

    bitwarden-cli
  ];
}
