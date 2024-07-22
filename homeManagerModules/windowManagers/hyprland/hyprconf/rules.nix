{...}: {
  # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
  # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "suppressevent maximize, class:.*" # You'll probably like this.
      "float,class:^(net.davidotek.pupgui2)$" #ProtonUp-Qt
      "float,class:^(yad)$" #Protontricks-Gtk
      "float,class:^(qt5ct)$"
      "float,class:^(nwg-look)$"
      "float,class:^(org.kde.ark)$"
      "float,class:^(pavucontrol)$"
      "float,class:^(blueman-manager)$"
      "float,class:^(nm-applet)$"
      "float,class:^(nm-connection-editor)$"
      "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
      "float,class:^(com.obsproject.Studio)$,title:^(Controls)$"
    ];

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

      # other
      "special,gapsin:24,gapsout:64"
    ];

    layerrule = "blur, logout";
  };
}
