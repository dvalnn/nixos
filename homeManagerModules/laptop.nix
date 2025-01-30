{pkgs, ...}: {
  imports = [
    ./common.nix
    ./windowManagers
  ];

  awesomeWM.enable = false;

  nvim.enable = true;
  nvf.enable = false;

  home.packages = with pkgs; [
    moonlight-qt
  ];
}
