# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: let
  gruvbox-dark-medium = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../common.nix
  ];
  networking.hostName = "nix-desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  networking.firewall.allowedTCPPorts = [];
  networking.firewall.allowedUDPPorts = [];

  # xserver settings
  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];

    xkb = {
      layout = "pt";
      variant = "";
    };
  };

  autoStyling.enable = true;
  autoStyling.colorScheme = gruvbox-dark-medium;

  hyprland.enable = true;
  awesomeWM.enable = true;

  services.xserver.displayManager = {
    sddm.enable = true;
    defaultSession = "none+awesome";
    # session commands are executed just after wm starts
    sessionCommands = ''
      xrandr \
      --output DP-0  --mode 1920x1080 --rate 144 --pos 1920x0 --rotate normal \
      --output DP-4 --primary --mode 1920x1080 --rate 144 --pos 0x0 --rotate normal \
    '';
  };

  hardware = {
    opengl = {
      # https://nixos.wiki/wiki/Nvidia
      enable = true;
      driSupport32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;

      open = false;
      nvidiaSettings = true;
      forceFullCompositionPipeline = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  # Module configuration options
  gaming.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
