{
  config,
  lib,
  ...
}: {
  options = {
    zellij.enable = lib.mkEnableOption "enable zellij";
  };

  config = lib.mkIf config.zellij.enable {
    programs.zellij = {
      enable = true;
      enableZshIntegration =
        if config.zsh.enable
        then true
        else false;
      settings = {
        layout = "compact";
        plugins = {
          "forgot location=" = "https://github.com/karimould/zellij-forgot/releases/download/0.4.0/zellij_forgot.wasm";
        };
      };
    };
  };
}
