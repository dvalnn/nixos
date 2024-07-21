{...}: {
  wayland.windowManager.hyprland.settings = {
    # See https://wiki.hyprland.org/Configuring/Keywords/
    "$terminal" = "alacritty";
    "$fileManager" = "thunar";
    "$menu" = "wofi --show drun";
    "$browser" = "firefox";
  };
}
