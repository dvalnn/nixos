{
  config,
  lib,
  ...
}: {
  options = {
    sunshine.enable = lib.mkEnableOption "enables sunshine programs and options";
  };

  config = lib.mkIf config.sunshine.enable {
    services.sunshine = {
      enable = true;
      autoStart = true;
      openFirewall = true;
      capSysAdmin = true;
    };
  };
}
