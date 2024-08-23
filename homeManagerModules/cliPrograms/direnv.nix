{
  lib,
  config,
  ...
}: {
  options = {
    direnv.enable = lib.mkEnableOption "enable zoxide with zsh integration";
  };

  config = lib.mkIf config.direnv.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration =
        if config.zsh.enable
        then true
        else false;

      nix-direnv.enable = true;
    };
  };
}
