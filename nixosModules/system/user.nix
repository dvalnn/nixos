{
  pkgs,
  lib,
  config,
  user,
  ...
}: {
  options = {
    user.enable = lib.mkEnableOption "enables default user (dvalinn) as a trusted user and with zsh and default shell";
  };

  config = lib.mkIf config.user.enable {
    users.users.${user.name} = {
      isNormalUser = true;
      description = user.description;
      extraGroups = ["networkmanager" "wheel" "gamemode" "docker" "plugdev"];
      openssh.authorizedKeys.keys = [];
      shell = pkgs.zsh;
      uid = user.uid;
    };

    programs.zsh.enable = true;
    nix.settings.trusted-users = ["${user.name}"];
  };
}
