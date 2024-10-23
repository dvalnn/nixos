{
  lib,
  config,
  ...
}: {
  options = {
    zoxide.enable = lib.mkEnableOption "enable zoxide";
    zoxide.zshIntegration = lib.mkEnableOption "enable zoxide integration with Zsh";
  };

  config = lib.mkIf config.zoxide.enable {
    programs.zoxide = let
      zshIntegration =
        if config.zsh.enable
        then true
        else false;
    in {
      enable = true;
      enableZshIntegration = lib.mkDefault zshIntegration;
    };
  };
}
