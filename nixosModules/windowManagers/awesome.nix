{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    awesomeWM.enable = lib.mkEnableOption "enables awesomeWM";
  };

  config = lib.mkIf config.awesomeWM.enable {
    environment.systemPackages = with pkgs; [
      xorg.xinit
      xorg.xrandr
    ];

    services.xserver.windowManager.awesome = {
      enable = true;
      noArgb = false;
      # luaModules = with pkgs.lua54Packages; [
      # ];
    };
  };
}
