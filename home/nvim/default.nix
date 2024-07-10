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
    defaultEditor = true;

    extraPackages = with pkgs; [
      # Language servers
      nil # nix
      taplo # TOML
      lua-language-server
      python312Packages.python-lsp-server
    ];

    plugins = with pkgs.vimPlugins; [
      # tmux integration
      vim-tmux-navigator

      # user interface
      indentLine # vertical indentation guides
      lualine-nvim
      catppuccin-nvim # color scheme (default mocha)

      # props to ThePrimeagen
      harpoon2
      undotree

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
    ];
  };
}
