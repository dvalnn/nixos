{ lib, ... }:
{
  imports = [
    ./misc.nix
    ./nh.nix
    ./packages.nix
    ./picom.nix
    ./ssh.nix
    ./user.nix
  ];

  misc.enable = lib.mkDefault true;
  nh.enable = lib.mkDefault true;
  defaultPackages.enable = lib.mkDefault true;
  openSSH.enable = lib.mkDefault true;
  user.enable = lib.mkDefault true;
}
