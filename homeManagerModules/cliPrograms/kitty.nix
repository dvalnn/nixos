{
  lib,
  config,
  ...
}:
{
  options = {
    kitty.enable = lib.mkEnableOption "enable kitty terminal";
  };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = if config.zsh.enable then true else false;
    };
  };
}
