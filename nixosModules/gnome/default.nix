{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    gnomeDE.enable = lib.mkEnableOption "enables gnome desktop environment";
  };

  config = lib.mkIf config.gnomeDE.enable {
    environment.systemPackages = with pkgs; [
      gnome-tweaks
      adwaita-icon-theme
    ];

    services = {
      xserver = {
        desktopManager.gnome.enable = true;
        displayManager.gdm.enable = true;
      };

      udev.packages = with pkgs; [gnome-settings-daemon];
    };

    hm = {lib, ...}: {
      dconf = with lib.hm.gvariant; {
        enable = true;
        settings = {
          "org/gnome/shell" = {
            disable-user-extensions = false;
            enabled-extensions = with pkgs.gnomeExtensions; [
              system-monitor.extensionUuid
            ];
          };

          "org/gnome/desktop/interface" = {
            color-scheme = "default";
            cursor-size = 32;
            cursor-theme = "Vanilla-DMZ";
            document-font-name = "Noto Serif  11";
            enable-animations = true;
            font-name = "Noto Sans 12";
            gtk-theme = "adw-gtk3";
            icon-theme = "Adwaita";
            monospace-font-name = "FiraMono Nerd Font 12";
            scaling-factor = mkUint32 1;
            text-scaling-factor = 1.0;
            toolbar-style = "text";
          };

          "org/gnome/desktop/wm/keybindings" = {
            close = ["<Super>q"];
            move-to-workspace-1 = ["<Shift><Super>1"];
            move-to-workspace-2 = ["<Shift><Super>2"];
            move-to-workspace-3 = ["<Shift><Super>3"];
            move-to-workspace-4 = ["<Shift><Super>4"];
            panel-run-dialog = ["<Super>space"];
            switch-input-source = [];
            switch-input-source-backward = [];
            switch-to-workspace-1 = ["<Super>1"];
            switch-to-workspace-2 = ["<Super>2"];
            switch-to-workspace-3 = ["<Super>3"];
            switch-to-workspace-4 = ["<Super>4"];
            toggle-fullscreen = ["<Shift><Super>f"];
            toggle-maximized = ["<Super>f"];
          };

          "org/gnome/desktop/wm/preferences" = {
            auto-raise = true;
            button-layout = "icon:minimize,maximize,close";
            focus-mode = "mouse";
            num-workspaces = 4;
            resize-with-right-button = true;
          };

          "org/gnome/mutter" = {
            center-new-windows = false;
            dynamic-workspaces = false;
            edge-tiling = true;
            overlay-key = "Super_L";
            workspaces-only-on-primary = true;
          };

          "org/gnome/settings-daemon/plugins/media-keys" = {
            calculator = ["<Super>c"];
            custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
            home = ["<Super>e"];
            magnifier-zoom-in = ["<Alt><Super>plus"];
            www = ["<Super>b"];
          };

          "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
            binding = "<Super>Return";
            command = "alacritty";
            name = "terminal";
          };

          "org/gnome/shell/keybindings" = {
            switch-to-application-1 = [];
            switch-to-application-2 = [];
            switch-to-application-3 = [];
            switch-to-application-4 = [];
          };
        };
      };
    };
  };
}
