{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    nvim.enable = lib.mkEnableOption "enable neovim";
  };

  config = lib.mkIf config.nvim.enable {
    home.file = {
      ".config/nvim" = {
        source = ./config;
        recursive = true;
      };
      ".config/nvim/lua/after/lang/java.lua".text = ''
        local config = {
            cmd = {'${pkgs.jdt-language-server}/bin/jdtls'},
            root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
        }
        require('jdtls').start_or_attach(config)
      '';
    };

    programs.neovim = {
      enable = true;
      vimAlias = true;
      defaultEditor = true;

      extraPackages = with pkgs; [
        # Language servers
        nil # nix
        taplo # TOML
        lua-language-server
        python312Packages.python-lsp-server
        jdt-language-server #java
      ];

      plugins = with pkgs.vimPlugins; [
        # misc
        mini-nvim
        persistence-nvim
        vim-tmux-navigator
        zellij-nav-nvim

        # user interface
        indentLine # vertical indentation guides
        lualine-nvim
        vim-startify # starter page
        gitsigns-nvim
        todo-comments-nvim

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
        (nvim-treesitter.withPlugins (
          p: [
            p.c
            p.cpp
            p.rust
            p.go
            p.lua
            p.nix
            p.markdown
            p.python
            p.javascript
            p.java
            p.zig
            p.kdl
          ]
        ))

        #LSP and completion
        lsp-zero-nvim
        nvim-lspconfig
        luasnip

        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-cmdline
        nvim-cmp

        rustaceanvim # rust specific features
        crates-nvim

        nvim-jdtls # java specific features

        vim-nix # better nix language support
      ];
    };
  };
}
