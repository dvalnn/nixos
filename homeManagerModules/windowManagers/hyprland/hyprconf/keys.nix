{...}: {
  wayland.windowManager.hyprland.settings = {
    # variables
    "$mainMod" = "SUPER";

    # Keybindings
    bind = [
      # Ags keybinds
      "$mainMod, Tab, exec, ~/.config/ags/shared/scripts/sidebar.sh toggle"
      "$mainMod, A, exec, ~/.config/ags/shared/scripts/changemode.sh appLauncher"
      "$mainMod, C, exec, ~/.config/ags/shared/scripts/changemode.sh commandLauncher"

      # apps
      "$mainMod, Return, exec, $terminal"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, Space, exec, $menu"
      "$mainMod, B, exec, $browser"

      "$mainMod, Q, killactive,"
      "$mainMod SHIFT, Q, exit,"

      "ALT, F4, exec, hyprctl kill"
      "$mainMod CTRL ALT, L, exec, swaylock"
      "$ALT, Return, fullscreen"

      # "$mainMod, P, pseudo," # dwindle
      "$mainMod, O, togglesplit," # dwindle
      # "$mainMod, V, togglefloating,"
      "$mainMod, V, exec, ~/.config/hypr/scripts/togglefloating.sh"

      # Move focus with mainMod + arrow keys
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # Move focus with mainMod + hjkl
      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      # # Move focus to specific monitor
      # "$mainMod ALT, H, focusmonitor, l"
      # "$mainMod ALT, L, focusmonitor, r"
      # "$mainMod ALT, K, focusmonitor, u"
      # "$mainMod ALT, J, focusmonitor, d"

      # resize windows
      "$mainMod SHIFT, right, resizeactive, 30 0"
      "$mainMod SHIFT, left, resizeactive, -30 0"
      "$mainMod SHIFT, up, resizeactive, 0 -30"
      "$mainMod SHIFT, down, resizeactive, 0 30"

      # resize windows
      "$mainMod SHIFT, L, resizeactive, 30 0"
      "$mainMod SHIFT, H, resizeactive, -30 0"
      "$mainMod SHIFT, K, resizeactive, 0 -30"
      "$mainMod SHIFT, J, resizeactive, 0 30"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, exec, ~/.config/hypr/scripts/moveworkspace.sh 1"
      "$mainMod, 2, exec, ~/.config/hypr/scripts/moveworkspace.sh 2"
      "$mainMod, 3, exec, ~/.config/hypr/scripts/moveworkspace.sh 3"
      "$mainMod, 4, exec, ~/.config/hypr/scripts/moveworkspace.sh 4"
      "$mainMod, 5, exec, ~/.config/hypr/scripts/moveworkspace.sh 5"
      "$mainMod, 6, exec, ~/.config/hypr/scripts/moveworkspace.sh 6"
      "$mainMod, 7, exec, ~/.config/hypr/scripts/moveworkspace.sh 7"
      "$mainMod, 8, exec, ~/.config/hypr/scripts/moveworkspace.sh 8"
      "$mainMod, 9, exec, ~/.config/hypr/scripts/moveworkspace.sh 9"
      "$mainMod, 0, exec, ~/.config/hypr/scripts/moveworkspace.sh 10"

      # "$mainMod, 1, workspace, 1"
      # "$mainMod, 2, workspace, 2"
      # "$mainMod, 3, workspace, 3"
      # "$mainMod, 4, workspace, 4"
      # "$mainMod, 5, workspace, 5"
      # "$mainMod, 6, workspace, 6"
      # "$mainMod, 7, workspace, 7"
      # "$mainMod, 8, workspace, 8"
      # "$mainMod, 9, workspace, 9"
      # "$mainMod, 0, workspace, 10"

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

      # Example special workspace (scratchpad)
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      # Screenshots
      "$mainMod, P, exec, ~/.config/hypr/scripts/screenshot.sh s" # drag to snip an area / click on a window to print it
      "$mainMod CTRL, P, exec, ~/.config/hypr/scripts/screenshot.sh sf" # frozen screen, drag to snip an area / click on a window to print it
      "$mainMod ALT, P, exec, ~/.config/hypr/scripts/screenshot.sh m" # print focused monitor
      ",print, exec, ~/.config/hypr/scripts/screenshot.sh p" # print all monitor outputs

      # bind = $mainMod SHIFT, W, exec, pkill -x rofi || ~/.config/hypr/scripts/wallpaperselect.sh # rofi wall select menu
      # bind = $mainMod, V, exec, pkill -x rofi || ~/.config/hypr/scripts/cliphist.sh c  # open Pasteboard in screen center
      # bind = ,XF86PowerOff, exec, ~/.config/eww/shared/scripts/togglelogout.sh
    ];

    bindl = [
      # audio
      ", F10, exec, ~/.config/hypr/scripts/volumecontrol.sh -o m" # toggle audio mute
      ", XF86AudioMute, exec, ~/.config/hypr/scripts/volumecontrol.sh -o m" # toggle audio mute
      ", XF86AudioMicMute, exec, ~/.config/hypr/scripts/volumecontrol.sh -i m" # toggle microphone mute

      # Trigger when the switch is turning off
      ", switch:on:Lid Switch, exec, swaylock && systemctl suspend"
    ];

    bindel = [
      # audio
      ", F11, exec, ~/.config/hypr/scripts/volumecontrol.sh -o d" # decrease volume
      ", F12, exec, ~/.config/hypr/scripts/volumecontrol.sh -o i" # increase volume
      ", XF86AudioLowerVolume, exec, ~/.config/hypr/scripts/volumecontrol.sh -o d" # decrease volume
      ", XF86AudioRaiseVolume, exec, ~/.config/hypr/scripts/volumecontrol.sh -o i" # increase volume

      ", XF86MonBrightnessUp, exec, ~/.config/hypr/scripts/brightnesscontrol.sh i" # increase brightness
      ", XF86MonBrightnessDown, exec, ~/.config/hypr/scripts/brightnesscontrol.sh d" # decrease brightness
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
