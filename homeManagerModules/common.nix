{ user, lib, ... }:
{
  imports = [
    ./cliPrograms
    ./otherPackages.nix
    # ./opera.nix
  ];

  # NOTE: fixes https://github.com/danth/stylix/issues/865
  nixpkgs.overlays = lib.mkForce null;

  home = {
    username = user.name;
    homeDirectory = "/home/${user.name}";
    sessionVariables = { };
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  cliPrograms.enable = true;
  nvim.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
