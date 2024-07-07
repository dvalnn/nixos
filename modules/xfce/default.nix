{...}:
{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "pt";
      variant = "";
    };

    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
  };
}
