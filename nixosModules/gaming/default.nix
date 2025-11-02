{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./steam.nix
    ./hamachi.nix
    ./sunshine.nix
  ];

  options = {
    gaming.enable = lib.mkEnableOption "enables gaming programs and options";
  };

  config = lib.mkIf config.gaming.enable {
    steam.enable = lib.mkDefault true;
    programs.gamemode.enable = lib.mkDefault true;
    hamachi.enable = lib.mkDefault false;
    sunshine.enable = lib.mkDefault false;

    # environment.systemPackages = with pkgs; [
    #   # mangohud # msi afterburner monitor thingy
    #   # bottles # wine presets
    # ];
  };
}
