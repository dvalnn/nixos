{...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "ags"

      # start side monitor on workspace 6
      "hyprctl dispatch focusmonitor 0"
      "hyprctl dispatch workspace 6"

      # start main monitor on workspace 1
      "hyprctl dispatch focusmonitor 1"
      "hyprctl dispatch workspace 1"

      # "~/.config/hypr/scripts/wallpaperdaemon.sh"
    ];
  };
}
