{
  pkgs,
  pkgs-stable,
  ...
}: {
  home.packages =
    (with pkgs-stable; [
      spotify
      google-chrome
    ])
    ++ (with pkgs; [
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

      # File management
      yazi
      xfce.thunar
    ]);
}
