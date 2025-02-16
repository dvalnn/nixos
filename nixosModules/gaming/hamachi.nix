{
  lib,
  config,
  ...
}:
{
  options = {
    hamachi.enable = lib.mkEnableOption "enable logmein-hamachi vpn service";
  };

  config = lib.mkIf config.hamachi.enable {
    services.logmein-hamachi.enable = true;
    programs.haguichi.enable = true;
  };
}
