{
  lib,
  config,
  user,
  ...
}:
{
  options = {
    git.enable = lib.mkEnableOption "enable zoxide with zsh integration";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      settings = {
        user.name = user.name;
        user.email = user.email;
      };

      signing = {
        signByDefault = false;
      };
    };
  };
}
