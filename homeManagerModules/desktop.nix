{...}: {
  imports = [
    ./common.nix
    ./windowManagers
  ];

  awesomeWM.enable = false;

  nvim.enable = true;
  nvf.enable = false;
}
