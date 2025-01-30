{pkgs, ...}: {
  imports = [
    ./common.nix
    ./windowManagers
  ];

  awesomeWM.enable = false;

  nvim.enable = false;
  nvf.enable = true;

  home.packages = with pkgs; [
    moonlight-qt
  ];
}
