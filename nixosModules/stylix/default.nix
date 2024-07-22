{
  pkgs,
  lib,
  config,
  ...
}: let
  catppuccin = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
in {
  options = {
    autoStyling = {
      enable = lib.mkEnableOption "enables stylix auto styling";
      colorScheme = lib.mkOption {default = catppuccin;};
      image = lib.mkOption {default = ./default.png;};
    };
  };

  config = lib.mkIf config.autoStyling.enable {
    stylix.enable = true;

    stylix.base16Scheme = config.autoStyling.colorScheme;
    stylix.image = config.autoStyling.image;

    stylix.fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
