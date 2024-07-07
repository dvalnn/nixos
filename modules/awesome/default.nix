{pkgs, ...}:
{
  environment.systemPackages = with pkgs;[
    xorg.xinit
    xorg.xrandr
    arandr
  ];

  services.xserver = {
    enable = true;
    xkb = {
      layout = "pt";
      variant = "";
    };

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
