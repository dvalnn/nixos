{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;
  # Open ports in the firewall.
  networking.firewall.enable = true;

  # Locale settings
  time.timeZone = "Europe/Lisbon";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };

  # Keymap configuration for console
  console.keyMap = "pt-latin1";

  autoStyling.enable = true;

  environment.systemPackages = with pkgs; [
    xorg.xinit
    xorg.xrandr
  ];

  services.xserver = {
    enable = true;
    xkb = {
      layout = "pt";
      variant = "";
    };
  };

  services.avahi = {
    enable = true;

    ipv4 = true;
    nssmdns4 = true;

    ipv6 = true;
    nssmdns6 = true;

    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
    };
  };

  services.displayManager.sddm.enable = true;
}
