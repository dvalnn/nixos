{...}: {
  imports = [
    ./common.nix
    ./windowManagers
  ];

  awesomeWM.enable = true;
  # hyprland.enable = true;
}
