# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page;;
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  user,
  ...
}:
let
  gruvbox-dark-medium = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../common.nix
  ];

  networking = {
    hostName = "nix-desktop"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    firewall.allowedTCPPorts = [ ];
    firewall.allowedUDPPorts = [ ];
  };

  gnomeDE.enable = true;
  services = {
    displayManager.defaultSession = "gnome-xorg";

    xserver = {
      # enable nvidia drivers for x11 and wayland
      videoDrivers = [ "nvidia" ];

      displayManager = {
        sessionCommands = ''
          xrandr \
          --output DP-0  --mode 1920x1080 --rate 144 --pos 1920x0 --rotate normal \
          --output DP-4 --primary --mode 1920x1080 --rate 144 --pos 0x0 --rotate normal \
        '';

        gdm.wayland = false;
      };
    };

    zerotierone = {
      enable = true;
      joinNetworks = [ ];
    };
  };

  awesomeWM.enable = false;
  autoStyling.colorScheme = gruvbox-dark-medium;

  hardware = {
    graphics = {
      # renamed from "opengl"
      # https://nixos.wiki/wiki/Nvidia
      enable = true;
      enable32Bit = true; # renamed from driSupport32Bit
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

  # TODO: make this a module
  virtualisation.virtualbox = {
    host = {
      enable = false;
      enableExtensionPack = false;
    };
    guest = {
      enable = false;
      dragAndDrop = true;
    };
  };
  users.extraGroups.vboxusers.members = [ user.name ];

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  programs.wireshark.enable = true;

  # Module configuration options
  gaming.enable = true;
  sunshine.enable = false;
  homelabCifs.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
