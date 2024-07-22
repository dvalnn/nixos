{...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "ags"
      "~/.config/hypr/scripts/wallpaperdaemon.sh"
    ];
  };
}
