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
      };
    };

    # stylix.targets.zellij.enable = false;
    # home.file = let
    #   colors = config.lib.stylix.colors.withHashtag;
    # in {
    #   ".config/zellij/config.kdl".text = ''
    #     ${builtins.readFile ./config.kdl}
    #
    #     theme "stylix"
    #     themes {
    #       stylix {
    #         bg ${colors.base00}
    #         black ${colors.black}
    #         blue ${colors.blue}
    #         cyan ${colors.cyan}
    #         fg ${colors.foreground}
    #         green ${colors.green}
    #         magenta ${colors.magenta}
    #         orange ${colors.orange}
    #         red ${colors.base}
    #         white ${colors.white}
    #         yellow ${colors.yellow}
    #       }
    #     }
    #   '';
    # };
  };
}
