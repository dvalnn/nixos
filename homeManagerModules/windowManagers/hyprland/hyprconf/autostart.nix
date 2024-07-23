{...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "ags"

      # start main monitor on workspace 1
      "hyprctl dispatch focusmonitor 1"
      "hyprctl dispatch workspace 1"
    ];
  };
}
