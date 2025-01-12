{
  lib,
  config,
  ...
}: {
  options = {
    misc.enable = lib.mkEnableOption "enable miscelaneous essentials";
  };

  config = lib.mkIf config.misc.enable {
    nix.settings = {
      experimental-features = ["nix-command" "flakes"];

      substituters = [
        # Alternative nixpkgs mirrors
      ];

      trusted-public-keys = [];
      builders-use-substitutes = true;
    };

    # Enable CUPS to print documents
    services.printing.enable = true;

    # Audio
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
