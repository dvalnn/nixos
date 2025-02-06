{pkgs, ... }: {
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        appindicator.extensionUuid
        tiling-shell.extensionUuid
        blur-my-shell.extensionUuid
        tweaks-in-system-menu.extensionUuid
      ];
    };
  };

  home.packages = with pkgs; [
    gnome-tweaks
    adwaita-icon-theme
  ];
}

