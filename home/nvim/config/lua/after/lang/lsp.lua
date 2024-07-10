local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    -- see :help lsp-zero-keybindings
    -- to learn the available actions lsp_zero.default_keymaps({buffer = bufnr})
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
end)

require 'lspconfig'.lua_ls.setup {}
require 'lspconfig'.nil_ls.setup {} -- nix
require'lspconfig'.taplo.setup{} -- TOML
require'lspconfig'.pylsp.setup{} -- python
require'lspconfig'.gopls.setup{} -- go
require'lspconfig'.clangd.setup{}
