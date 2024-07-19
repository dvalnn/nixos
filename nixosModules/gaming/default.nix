{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./steam.nix
  ];

  options = {
    gaming.enable = lib.mkEnableOption "enables gaming programs and options";
  };

  config = lib.mkIf config.gaming.enable {
    steam.enable = true;
    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      mangohud # msi afterburner monitor thingy
      bottles # wine presets
    ];
  };

}
