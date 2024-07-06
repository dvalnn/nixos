{pkgs, ... }: 
{
  programs.neovim = {
    enable = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      # Language servers
      nixd # nix
      gopls
      lua-language-server
      python312Packages.python-lsp-server
      libgcc
      libclang
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./lua/config.lua}
      ${builtins.readFile ./lua/nvim-tree.lua}
      ${builtins.readFile ./lua/treesitter.lua}

      local function defered()
          ${builtins.readFile ./lua/lsp.lua}
          ${builtins.readFile ./lua/cmp.lua}
      end

      vim.defer_fn(defered, 70)
    '';

    plugins = with pkgs.vimPlugins; [
        # Add indentation lines
        indentLine

        # Color scheme
        {
            plugin = catppuccin-nvim;
            config = "colorscheme catppuccin";
        }

        # File tree
        nvim-web-devicons
        nvim-tree-lua

        # Better nix file support
        vim-nix

        # Treesitter and language grammar packs
        ( nvim-treesitter.withPlugins( 
          p: [p.c p.cpp p.rust p.go p.lua p.nix p.markdown])
        )

        #LSP
        nvim-lspconfig

        # Completion
        nvim-cmp
        luasnip
        cmp_luasnip
        friendly-snippets
    ];
  };
}
