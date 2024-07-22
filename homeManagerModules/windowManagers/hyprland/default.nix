{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    ./hyprconf/autostart.nix
    ./hyprconf/input.nix
    ./hyprconf/keys.nix
    ./hyprconf/lookAndFeel.nix
    ./hyprconf/monitor.nix
    ./hyprconf/programs.nix
    ./hyprconf/rules.nix

    inputs.ags.homeManagerModules.default
  ];

  options = {
    hyprland.enable = lib.mkEnableOption "enable hyprland window manager";
  };

  config = lib.mkIf config.hyprland.enable {
    services.dunst.enable = true; # notification deamon
    programs.wofi.enable = true; # rofi launcher for wayland
    programs.swaylock.enable = true; # lockscreen manager

    programs.ags = {
      enable = true;
      configDir = ./ags;
      extraPackages = with pkgs; [
        libdbusmenu-gtk3
        gtksourceview
        webkitgtk
        accountsservice
      ];
    };

    home.packages = with pkgs; [
      gvfs # virtual filesystem support

      pamixer # volume and stuff
      brightnessctl # brightness/backlight control

      swappy # wayland screenshot editor
      grimblast # wayland screenshot cli

      wl-clipboard # clipboard utilities

      inputs.swww.packages.${pkgs.system}.swww # wayland wallpaper daemon
    ];

    home.file = {
      ".config/swww" = {
        source = ./swww;
        recursive = true;
      };

      ".config/rofi" = {
        source = ./wofi;
        recursive = true;
      };
    };

    wayland.windowManager.hyprland = {
      enable = true;

      # plugins = with inputs.hyprland-plugins.packages."${pkgs.system}"; [
      #   borders-plus-plus
      # ];

      settings = {
        # See https://wiki.hyprland.org/Configuring/Environment-variables/
        env = [
          "XCURSOR_SIZE,24"
          "HYPRCURSOR_SIZE,24"
        ];
      };
    };
  };
}
