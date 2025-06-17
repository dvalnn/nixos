{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    defaultPackages.enable = lib.mkEnableOption "enables some usefull system packages that are nice to have by default on every system";
  };

  config = lib.mkIf config.defaultPackages.enable {
    environment.systemPackages = with pkgs; [
      vim
      wget
      curl
      git
      pciutils # lspci
      usbutils # lsusb
      inetutils
      binutils
    ];
  };
}
