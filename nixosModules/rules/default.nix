{pkgs, ...}: {
  services.udev = {
    packages = with pkgs; [
      picoprobe-udev-rules # probe-rs udev rules
    ];
    extraRules = ''
    '';
  };
}
