{user, ...}: {
  imports = [
    ./cliPrograms
    ./otherPackages.nix
  ];

  # programs.git = {
  #   enable = true;
  #   userName = user.name;
  #   userEmail = user.email;
  # };

  # programs.direnv = {
  #   enable = true;
  #   enableZshIntegration = true;
  #   nix-direnv.enable = true;
  # };

  cliPrograms.enable = true;

  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";

  home.sessionVariables = {};

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
