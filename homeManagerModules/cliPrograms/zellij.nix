{
  config,
  lib,
  ...
}: {
  options = {
    zellij.enable = lib.mkEnableOption "enable zellij";
  };

  config = lib.mkIf config.zellij.enable {
    programs.zellij = {
      enable = true;
      enableZshIntegration =
        if config.zsh.enable
        then true
        else false;
      settings = {
        # Will be translated to YAML. Example:
        # theme = "custom";
        #   themes.custom.fg = "#ffffff";
      };
    };
  };
}
