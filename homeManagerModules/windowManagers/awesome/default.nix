{pkgs, ...}: {
  home.file = {
    ".config/awesome" = {
      source = ./config;
      recursive = true;
    };
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
}
