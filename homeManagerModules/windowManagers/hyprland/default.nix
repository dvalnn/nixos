{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    ./input.nix
    ./keys.nix
    ./lookAndFeel.nix
    ./monitor.nix
    ./programs.nix
    ./rules.nix
  ];

  options = {
    hyprland.enable = lib.mkEnableOption "enable hyprland window manager";
  };

  config = lib.mkIf config.hyprland.enable {
    services.dunst.enable = true; # notification deamon
    programs.wofi.enable = true; # rofi launcher for wayland

    wayland.windowManager.hyprland = {
      enable = true;

      # plugins = with inputs.hyprland-plugins.packages."${pkgs.system}"; [
      #   borders-plus-plus
      # ];

      settings = {
        #############################
        ### ENVIRONMENT VARIABLES ###
        #############################

        # See https://wiki.hyprland.org/Configuring/Environment-variables/
        env = [
          "XCURSOR_SIZE,24"
          "HYPRCURSOR_SIZE,24"
        ];
      };
    };
  };
}
