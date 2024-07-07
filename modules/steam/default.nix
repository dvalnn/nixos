{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = with pkgs; [
    mangohud # msi afterburner monitor thingy
    protonup # used to install proton ge compatibility layer
    lutris # other launcher for games
    bottles # wine presets
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH = 
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.gamemode.enable = true;

  # gamemode and mangohud make it so that 
  # on steam we can use as lauch options
  # gamemoderun %command% or gamescope %command% or mangohud %command%
}
