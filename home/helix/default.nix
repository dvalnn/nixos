{pkgs, ...}: {
  programs.helix = {
    enable = true;

    extraPackages = with pkgs; [
      # Language Servers
      nil # nix
      lua-language-server
    ];

    languages = {
      use-grammars = {
        only = ["nix" "lua"];
      };
    };

    settings = {
      # NOTE: theme value is currently being set by stylix
      # theme = "catppuccin-mocha"

      editor = {
        true-color = true;
        cursorline = true;
        color-modes = true;
        popup-border = "all";
        line-number = "relative";
        bufferline = "multiple";

        indent-guides = {
          render = true;
        };
      };

      keys.normal = {
        C-h = "jump_view_left";
        C-l = "jump_view_right";
        C-k = "jump_view_up";
        C-j = "jump_view_down";
      };
    };
  };
}
