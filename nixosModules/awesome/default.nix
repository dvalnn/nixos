{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    awesomeWM.enable = lib.mkEnableOption "enables awesomeWM rice and dependencies";
  };

  config = lib.mkIf config.awesomeWM.enable {
    services.xserver.windowManager.awesome = {
      enable = true;
      noArgb = false;
      # luaModules = with pkgs.lua54Packages; [
      # ];
    };

    hm = {
      home.file = {
        ".config/awesome" = {
          source = ./config;
          recursive = true;
        };

        ".config/rofi/gruvbox.rasi".source = ./rofi/gruvbox.rasi;
      };
    };

    # Rice dependencies
    environment.systemPackages = with pkgs; [
      terminus_font
      alsa-utils # amixer
      dmenu
      mpc-cli
      mpd
      scrot
      xorg.xbacklight
      xsel
      slock
      rofi
    ];
  };
}
