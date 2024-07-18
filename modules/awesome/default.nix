{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    xorg.xinit
    xorg.xrandr

    # awesome rice dependencies
    networkmanagerapplet # network control
    light # light/brightness control
    alsa-utils # sound control
    acpi # battery information
    nitrogen # wallpaper browser and setter
    playerctl # used for the music player widget
    redshift # bluelight filter widget
    scrot # screenshot tool
    gpick # color picker

    # nerdfonts.override {fonts = ["JetBrainsMono" "Ubuntu" "CaskaydiaCove"];}
    nerdfonts
    papirus-icon-theme
  ];

  services.xserver = {
    enable = true;
    xkb = {
      layout = "pt";
      variant = "";
    };

    windowManager = {
      awesome = {
        enable = true;
        noArgb = false;
        # luaModules = with pkgs.lua54Packages; [
        # ];
      };
    };
  };
}
