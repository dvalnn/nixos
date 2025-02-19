{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    nvim.enable = lib.mkEnableOption "enable neovim";
  };

  config = lib.mkIf config.nvim.enable {
    home.file = {
      ".config/nvim" = {
        source = ./config;
        recursive = true;
      };
    };

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    programs.neovim = {
      enable = true;
      vimAlias = true;
      defaultEditor = true;

      extraPackages = with pkgs; [
        # global servers

        nil # nix
        nixfmt-rfc-style

        taplo # TOML

        lua-language-server

        python312Packages.python-lsp-server
      ];

      plugins = with pkgs.vimPlugins; [
        # misc
        mini-nvim
        persistence-nvim
        vim-tmux-navigator
        zellij-nav-nvim

        # user interface
        lualine-nvim
        vim-startify # starter page
        gitsigns-nvim
        todo-comments-nvim
        rainbow-delimiters-nvim
        # indent-blankline-nvim

        catppuccin-nvim
        gruvbox-nvim

        # props to ThePrimeagen
        harpoon2
        undotree

        # File tree
        nvim-web-devicons
        nvim-tree-lua

        # Telescope
        plenary-nvim # telescope dependency
        dressing-nvim # better telescope ui
        telescope-nvim
        telescope-fzf-native-nvim

        # Treesitter and language grammar packs
        nvim-treesitter.withAllGrammars
        nvim-treesitter-textobjects
        nvim-ts-autotag

        lsp-zero-nvim
        nvim-lspconfig
        luasnip

        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-cmdline
        nvim-cmp
        copilot-vim

        rustaceanvim # rust specific features
        crates-nvim

        vim-nix # better nix language support
      ];
    };
  };
}
