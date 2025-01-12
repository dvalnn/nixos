{...}: {
  imports = [
    ./common.nix
    ./windowManagers
  ];

  awesomeWM.enable = true;
  services.unclutter.enable = true;
}
