{pkgs, ...}: {
  home.file = {
    ".config/awesome" = {
      source = ./config;
      recursive = true;
    };

    ".config/rofi/gruvbox.rasi".source = ./rofi/gruvbox.rasi;
  };

  # Rice dependencies
  home.packages = with pkgs; [
    terminus_font
    alsa-utils # amixer
    dmenu
    mpc-cli
    mpd
    scrot
    unclutter
    xorg.xbacklight
    xsel
    slock
  ];

  # services.picom.enable = true; #TODO: place this under enable option
}
