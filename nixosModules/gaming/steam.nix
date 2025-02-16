{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    steam.enable = lib.mkEnableOption "enables steam and proton";
  };

  config = lib.mkIf config.steam.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    environment.systemPackages = with pkgs; [
      protonup # used to install proton ge compatibility layer
    ];

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibilitytools.d";
    };

    # gamemode and mangohud make it so that
    # on steam we can use as lauch options
    # gamemoderun %command% or gamescope %command% or mangohud %command%
  };
}
