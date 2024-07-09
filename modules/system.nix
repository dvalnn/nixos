{ pkgs, ... }: 
let 
  username = "dvalinn";
in{
  users.users.dvalinn = {
    isNormalUser = true;
    description = "Tiago Amorim";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [ ];
  };

  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    pciutils # lspci
    usbutils # lsusb

    # nh dependencies / add-ons
    nvd
    nix-output-monitor
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 3 --keep-since 3d";
    flake = "/home/dvalinn/nixos";
  };

  nix.settings = {
    trusted-users = [username];

    experimental-features = ["nix-command" "flakes"];

    substituters = [
      # Alternative nixpkgs mirrors
    ];

    trusted-public-keys = [ ];

    builders-use-substitutes = true;
  };

  time.timeZone = "Europe/Lisbon";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };

  # Keymap configuration for console
  console.keyMap = "pt-latin1";

  # Enable CUPS to print documents
  services.printing.enable = true;

  # Audio
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable =true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    # Uncomment for jack applications
    #jack.enable = true;
  };

  # Enable OpenSSH Deadom
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
    openFirewall = true;
  };
}
