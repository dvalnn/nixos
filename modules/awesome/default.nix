{pkgs, ...}:
{
  environment.systemPackages = with pkgs;[
    xorg.xinit
  ];

  services.xserver = {
    enable = true;
    xkb = {
      layout = "pt";
      variant = "";
    };

    resolutions = [{
      x = 1920;
      y = 1080;
    }];

    windowManager = {
      awesome = {
        enable = true;
        noArgb = false;
        luaModules = with pkgs.lua54Packages;[
          vicious # modular widget library
        ];
      };
    };
  };
}
