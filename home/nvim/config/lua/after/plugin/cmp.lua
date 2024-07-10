require'cmp'.setup {
    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },

    sources = {
      { name = 'luasnip' },
      -- more sources
    },
  }

require("luasnip.loaders.from_vscode").lazy_load()
-- TODO: add keymaps from lazy vim distro
