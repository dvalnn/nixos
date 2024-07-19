{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    hyprland.enable = lib.mkEnableOption "enable hyprland window manager";
  };

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;

      plugins = with inputs.hyprland-plugins.packages."${pkgs.system}"; [
        borders-plus-plus
      ];

      settings = {
        "plugin:borders-plus-plus" = {
          add_borders = 1;

          "col.border_1" = "rgb(ffffff)";
          "col.border_2" = "rgb(2222ff)";

          border_size_1 = 10;
          border_size_2 = -1;

          natural_rounding = "yes";
        };

        decoration = {
          shadow_offset = "0 5";
        };

        "$mod" = "SUPER";

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
          "$mod ALT, mouse:272, resizewindow"
        ];
      };
    };
  };
}
