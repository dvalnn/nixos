{
  pkgs,
  lib,
  config,
  user,
  ...
}: {
  options = {
    nh.enable = lib.mkEnableOption "enables nh (nix helper) config and dependencies";
  };

  config = lib.mkIf config.nh.enable {
    environment.systemPackages = with pkgs; [
      # nh dependencies / add-ons
      nvd
      nix-output-monitor
    ];

    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep 3 --keep-since 3d";
      flake = "/home/${user.name}/nixos";
    };
  };
}
