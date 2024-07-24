{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    picom.enable = lib.mkEnableOption "enables picom";
  };

  config = lib.mkIf config.picom.enable {
    environment.systemPackages = with pkgs; [
      (picom.overrideAttrs (oldAttrs: rec {
        src = fetchFromGitHub {
          owner = "pijulius";
          repo = "picom";
          rev = "b8fe9323e7606709d692976a7fe7d2455b328bc6";
          hash = "sha256-bXeoWg1ZukXv+6ZNeRc8gGNsbtBztyW5lpfK0lQK+DE=";
        };
      }))
    ];
  };
}
