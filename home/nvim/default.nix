{pkgs, ...}: {
  home.file = {
    ".config/nvim" = {
      source = ./config;
      recursive = true;
    };
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      # Language servers
      nixd # nix
      gopls
      libgcc
      libclang
      rust-analyzer
      lua-language-server
      python312Packages.python-lsp-server
    ];

    plugins = with pkgs.vimPlugins; [
      # tmux integration
      vim-tmux-navigator

      # user interface
      indentLine # vertical indentation guides
      catppuccin-nvim # color scheme (default mocha)

      # File tree
      nvim-web-devicons
      nvim-tree-lua

      # Telescope
      plenary-nvim
      telescope-nvim

            # Treesitter and language grammar packs
      (
        nvim-treesitter.withPlugins (
          p: [p.c p.cpp p.rust p.go p.lua p.nix p.markdown]
        )
      )

      # language support
      vim-nix

      #LSP
      nvim-lspconfig

      # Completion
      luasnip
      nvim-cmp
      cmp_luasnip
      friendly-snippets
    ];
  };
}
