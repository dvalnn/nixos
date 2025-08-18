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
    spotify
    # obsidian
    # vscode-fhs
    # drawio
    # postman
    # wireshark

    # Office
    libreoffice-fresh
    hunspell # spell checking
    hunspellDicts.pt-pt
    hunspellDicts.en-us

    bitwarden-cli
  ];
}
