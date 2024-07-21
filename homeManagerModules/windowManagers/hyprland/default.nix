{
  pkgs,
  lib,
  config,
  # inputs,
  ...
}: {
  imports = [
    ./hyprconf/input.nix
    ./hyprconf/keys.nix
    ./hyprconf/lookAndFeel.nix
    ./hyprconf/monitor.nix
    ./hyprconf/programs.nix
    ./hyprconf/rules.nix
  ];

  options = {
    hyprland.enable = lib.mkEnableOption "enable hyprland window manager";
  };

  config = lib.mkIf config.hyprland.enable {
    home.packages = with pkgs; [
      ags
    ];

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
