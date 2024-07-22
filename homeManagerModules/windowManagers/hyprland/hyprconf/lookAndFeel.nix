{...}: {
  wayland.windowManager.hyprland.settings = {
    # Refer to https://wiki.hyprland.org/Configuring/Variables/

    # https://wiki.hyprland.org/Configuring/Variables/#general
    general = {
      gaps_in = 5;
      gaps_out = 20;

      border_size = 2;

      # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
      # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      # "col.inactive_border" = "rgba(595959aa)";

      # Set to true enable resizing windows by clicking and dragging on borders and gaps
      resize_on_border = false;

      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false;

      layout = "dwindle";
    };

    decoration = {
      rounding = 10;

      # Change transparency of focused and unfocused windows
      active_opacity = 1.0;
      inactive_opacity = 1.0;

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      # "col.shadow" = "rgba(1a1a1aee)";

      # https://wiki.hyprland.org/Configuring/Variables/#blur
      blur = {
        enabled = true;
        size = 3;
        passes = 1;

        vibrancy = 0.1696;
      };
      shadow_offset = "0 5";
    };

    # https://wiki.hyprland.org/Configuring/Variables/#animations
    animations = {
      enabled = true;

      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.76, 0.42, 0.74, 0.87"
        "winOut, 0.76, 0.42, 0.74, 0.87"
        "workIn, 0.72, -0.07, 0.41, 0.98"
        "linear, 1, 1, 1, 1"
      ];

      animation = [
        "windows, 1, 1.5, wind, popin"
        "windowsIn, 1, 1.5, workIn, popin"
        "windowsOut, 1, 1.5, workIn, popin"
        "windowsMove, 1, 1.5, wind, slide"

        "fadeIn, 1, 1.5, winIn"
        "fadeOut, 1, 1.5, winOut"

        "workspaces, 1, 1.5, workIn, slide"
        "specialWorkspace, 1, 2, workIn, slidevert"
      ];
    };

    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    dwindle = {
      pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # You probably want this
    };

    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    master = {
      new_status = "master";
    };

    # https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
      force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
      disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
    };
  };
}
