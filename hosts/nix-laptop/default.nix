# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ pkgs, ... }:
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
    hostName = "nix-laptop"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    firewall.allowedTCPPorts = [ ];
    firewall.allowedUDPPorts = [ ];
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  gnomeDE.enable = true;
  services = {
    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;
    libinput.touchpad.naturalScrolling = true;

    displayManager.defaultSession = "gnome-xorg";
    xserver.displayManager.gdm.wayland = false;

    zerotierone = {
      enable = true;
      joinNetworks = [ ];
    };
  };

  autoStyling.colorScheme = gruvbox-dark-medium;
  gaming.enable = true;
  homelabCifs.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
