{...}: {
  # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
  # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

  # Example windowrule v1
  # windowrule = float, ^(kitty)$

  # Example windowrule v2
  # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

  wayland.windowManager.hyprland.settings = {
    windowrulev2 = "suppressevent maximize, class:.*"; # You'll probably like this.

    # Bind workspaces to monitors
    workspace = [
      "1, monitor: DP-3"
      "2, monitor: DP-3"
      "3, monitor: DP-3"
      "4, monitor: DP-3"
      "5, monitor: DP-3"

      "6, monitor: DP-1"
      "7, monitor: DP-1"
      "8, monitor: DP-1"
      "9, monitor: DP-1"
      "0, monitor: DP-1"
    ];
  };
}
