{
  lib,
  config,
  ...
}:
{
  options = {
    ohMyPosh.enable = lib.mkEnableOption "enable oh-my-posh configuration";
  };

  config = lib.mkIf config.ohMyPosh.enable {
    programs.oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      settings = builtins.fromTOML (builtins.readFile ./oh-my-posh.toml);
    };
  };
}
