{
  lib,
  config,
  ...
}: {
  options = {
    zoxide.enable = lib.mkEnableOption "enable zoxide with zsh integration";
  };

  config = lib.mkIf config.zoxide.enable {
    programs.zoxide = {
      enable = true;
      enableZshIntegration =
        if config.zsh.enable
        then true
        else false;
    };
  };
}
