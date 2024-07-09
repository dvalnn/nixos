require("nvim-treesitter.configs").setup{
    -- Do not ensure installed here, grammar packs are installed through nix
    highlight = {
        enable = true,
    },
}

local lspconfig = require'lspconfig'

lspconfig.lua_ls.setup{}
lspconfig.nixd.setup{}

