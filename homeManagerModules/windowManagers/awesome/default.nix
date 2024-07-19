{pkgs,lib, config ,...}: {
  options = {
    awesomeWM.enable = lib.mkEnableOption "enables awesomeWM";
  };

  config = lib.mkIf config.awesomeWM.enable {

  home.packages = with pkgs; [
    xorg.xinit
    xorg.xrandr
  ];

  home.file = {
    ".config/awesome" = {
      source = ./config;
      recursive = true;
    };
  };

  xsession= {
    enable = true;

    windowManager = {
      awesome = {
        enable = true;
        noArgb = false;
        # luaModules = with pkgs.lua54Packages; [
        # ];
      };
    };
  };

  };
}
