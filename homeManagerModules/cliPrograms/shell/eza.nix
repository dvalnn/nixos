{
  lib,
  config,
  ...
}:
{
  options = {
    eza.enable = lib.mkEnableOption "enable eza";
  };

  config = lib.mkIf config.eza.enable {
    programs.eza = {
      enable = true;
      enableZshIntegration = if config.zsh.enable then true else false;
      enableNushellIntegration = false;

      git = true;
      icons = "auto";
    };
  };
}
