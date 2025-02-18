local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    -- see :help lsp-zero-keybindings
    -- to learn the available actions lsp_zero.default_keymaps({buffer = bufnr})
    local function opts(desc)
        return { desc = "LSP: " .. desc, buffer = bufnr, nowait = true, remap = false }
    end

    local builtin = require "telescope.builtin"

    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts("Code action"))
    vim.keymap.set("n", "<leader>R", function() vim.lsp.buf.rename() end, opts("Rename"))
    vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end, opts("Format buffer"))
    vim.keymap.set('n', '<leader>cs', builtin.lsp_document_symbols, opts("Find git files"))

    vim.keymap.set("n", "gd", function() builtin.lsp_definitions({ reuse_win = true }) end, opts("Goto definition"))
    vim.keymap.set("n", "gr", function() builtin.lsp_references({ reuse_win = true }) end, opts("Goto references"))
    vim.keymap.set("n", "gi", function() builtin.lsp_implementations({ reuse_win = true }) end, opts("Goto Implementation"))
    vim.keymap.set("n", "gt", function() builtin.lsp_type_definitions({ reuse_win = true }) end, opts("Goto Type Definition"))
end)

local nvim_lsp = require('lspconfig')

nvim_lsp.zls.setup {} -- zig
nvim_lsp.taplo.setup {}  -- TOML
nvim_lsp.pylsp.setup {}  -- python
nvim_lsp.gopls.setup {}  -- go
nvim_lsp.lua_ls.setup {} -- lua 
nvim_lsp.clangd.setup {} -- c / cpp

nvim_lsp.biome.setup {} -- js / ts
nvim_lsp.denols.setup {} -- deno

nvim_lsp.nil_ls.setup({ -- nix
   settings = {
      ['nil'] = {
         formatting = {
            command = { "nixfmt" },
         },
      },
   },
})
