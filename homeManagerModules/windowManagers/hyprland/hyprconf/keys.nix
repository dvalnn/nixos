{...}: {
  wayland.windowManager.hyprland.settings = {
    # variables
    "$mainMod" = "SUPER";

    # Keybindings
    bind = [
      "$mainMod, Return, exec, $terminal"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, Space, exec, $menu"
      "$mainMod, B, exec, $browser"

      "$mainMod, Q, killactive,"
      "$mainMod SHIFT, Q, exit,"

      "$mainMod, P, pseudo," # dwindle
      "$mainMod, O, togglesplit," # dwindle
      "$mainMod, V, togglefloating,"

      # Move focus with mainMod + arrow keys
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # "$mainMod SHIFT ALT, 1, movetoworkspacesilent, 1"
      # "$mainMod SHIFT ALT, 2, movetoworkspacesilent, 2"
      # "$mainMod SHIFT ALT, 3, movetoworkspacesilent, 3"
      # "$mainMod SHIFT ALT, 4, movetoworkspacesilent, 4"
      # "$mainMod SHIFT ALT, 5, movetoworkspacesilent, 5"
      # "$mainMod SHIFT ALT, 6, movetoworkspacesilent, 6"
      # "$mainMod SHIFT ALT, 7, movetoworkspacesilent, 7"
      # "$mainMod SHIFT ALT, 8, movetoworkspacesilent, 8"
      # "$mainMod SHIFT ALT, 9, movetoworkspacesilent, 9"
      # "$mainMod SHIFT ALT, 0, movetoworkspacesilent, 10"

      "$mainMod ALT, L, focusmonitor, l"
      "$mainMod ALT, H, focusmonitor, r"
      "$mainMod ALT, K, focusmonitor, u"
      "$mainMod ALT, J, focusmonitor, d"

      # Example special workspace (scratchpad)
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];

    # Combo keys
    # binds = [
    #   "$mainMod, W&L, swapactiveworkspaces, current l"
    #   "$mainMod, W&H, swapactiveworkspaces, current r"
    #   "$mainMod, W&K, swapactiveworkspaces, current u"
    #   "$mainMod, W&K, swapactiveworkspaces, current d"
    # ];

    # Mouse bindings
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
      "$mainMod ALT, mouse:272, resizewindow"
    ];
  };
}
