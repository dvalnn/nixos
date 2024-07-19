{
  lib,
  config,
  ...
}: {
  options = {
    openSSH.enable = lib.mkEnableOption "enables openshh daemon config";
  };

  config = lib.mkIf config.openSSH.enable {
    # Enable OpenSSH Deamon
    services.openssh = {
      enable = true;
      settings = {
        X11Forwarding = true;
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
      openFirewall = true;
    };
  };
}
