# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/system.nix
      ./../../modules/stylix.nix
      ./../../modules/awesome
      ./../../modules/steam
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix-desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Open ports in the firewall.
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [  ];
  networking.firewall.allowedUDPPorts = [  ];

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.modesetting.enable = true;

  # xserver settings
  services.xserver = 
  {
    xrandrHeads = [
      {
        output = "DP-0";
        primary = true;
        monitorConfig = ''
          Identifier     "Monitor0"
        	ModelName      "Acer KG271 A"
          Horizsync       180.0 - 180.0
          VertRefresh     30.0 - 144.0
          Option         "DPMS" "true"
        '';
      }
      {
        output = "DP-4";
        monitorConfig = ''
          Indentifier    "Monitor1"
          ModelName      "Asustek Computer Inc VG248"
          HorizSync       193.0 - 193.0
          VertRefresh     48.0 - 165.0
          Option         "DPMS"
        '';
      }
    ];

    screenSection = ''
      DefaultDepth   24
      Option         "metamodes"  "DP-4: 1920x1080_144 +1920+0, DP-0: 1920x1080_144 +0+0 {AllowGSYNCCompatible=On}"
      '';
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
