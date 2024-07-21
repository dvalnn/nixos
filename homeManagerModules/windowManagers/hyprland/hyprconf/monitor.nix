{...}: {
  # See https://wiki.hyprland.org/Configuring/Monitors/
  # Syntax: "MonitorName, Resolution@Refresh, Position, Scale"
  wayland.windowManager.hyprland.settings.monitor = [
    "DP-3, 1920x1080@144, 0x0, 1" # Acer primary
    "DP-1, 1920x1080@144, 1920x0, 1" # Asus secondary
    ",preferred,auto,1" # Any other random monitor
  ];
}
