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
      # Add indentation lines
      indentLine

      #tmux integration
      vim-tmux-navigator

      # Color scheme
      catppuccin-nvim

      # File tree
      nvim-web-devicons
      nvim-tree-lua

      # Better nix file support
      vim-nix

      # Treesitter and language grammar packs
      (
        nvim-treesitter.withPlugins (
          p: [p.c p.cpp p.rust p.go p.lua p.nix p.markdown]
        )
      )

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
