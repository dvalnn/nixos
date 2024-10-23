{pkgs, ...}: {
  services.udev = {
    packages = with pkgs; [
      picoprobe-udev-rules # probe-rs udev rules
      platformio-core.udev # platformio
      openocd # platformio
    ];
    extraRules = ''
    '';
  };
}
