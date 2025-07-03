local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    -- see :help lsp-zero-keybindings
    -- to learn the available actions lsp_zero.default_keymaps({buffer = bufnr})
    local function opts(desc)
        return { desc = "LSP: " .. desc, buffer = bufnr, nowait = true, remap = false }
    end

    local builtin = require "telescope.builtin"

    -- Enable inlay hints if the server supports it
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    vim.keymap.set('n', '<leader>cih',
        function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
        end,
        opts('Toggle Inlay Hints'))

    vim.keymap.set("n", "<leader>ca",
        function()
            vim.lsp.buf.code_action()
        end,
        opts("Code action"))

    vim.keymap.set("n", "cd",
        function()
            builtin.diagnostics({ reuse_win = true })
        end,
        opts("Show diagnostics"))

    vim.keymap.set("n", "<leader>R",
        function()
            vim.lsp.buf.rename()
        end,
        opts("Rename"))

    vim.keymap.set("n", "<leader>cf",
        function()
            vim.lsp.buf.format()
        end,
        opts("Format buffer"))

    vim.keymap.set('n', '<leader>cs', builtin.lsp_document_symbols, opts("Find document symbols"))
    vim.keymap.set('n', '<leader>cS', builtin.lsp_workspace_symbols, opts("Find workspace symbols"))

    vim.keymap.set("n", "gd",
        function()
            builtin.lsp_definitions({ reuse_win = true })
        end,
        opts("Goto definition"))

    vim.keymap.set("n", "gr",
        function()
            builtin.lsp_references({ reuse_win = true })
        end,
        opts("Goto references"))

    vim.keymap.set("n", "gi",
        function()
            builtin.lsp_implementations({ reuse_win = true })
        end,
        opts("Goto Implementation"))

    vim.keymap.set("n", "gt",
        function()
            builtin.lsp_type_definitions({ reuse_win = true })
        end,
        opts("Goto Type Definition"))
end)

vim.diagnostic.config({
    virtual_text = false,     -- Show inline/virtual text diagnostics
    signs = true,             -- Show signs in the gutter
    underline = true,         -- Underline diagnostics
    update_in_insert = false, -- Don't update diagnostics while typing
    severity_sort = true,     -- Sort diagnostics by severity
})

require("tiny-inline-diagnostic").setup({
    preset = "classic",
    transparent_bg = true,
    transparent_cursorline = true,
})

local nvim_lsp = require('lspconfig')

nvim_lsp.taplo.setup {}   -- TOML
nvim_lsp.nushell.setup {} -- nushell
nvim_lsp.jsonls.setup {}  -- json

nvim_lsp.gopls.setup {}   -- go
nvim_lsp.zls.setup {}     -- zig
nvim_lsp.clangd.setup {}  -- c / cpp

nvim_lsp.lua_ls.setup {}  -- lua
nvim_lsp.biome.setup {}   -- js / ts
nvim_lsp.denols.setup {}  -- deno

nvim_lsp.nil_ls.setup({   -- nix
    settings = {
        ['nil'] = {
            formatting = {
                command = { "nixfmt" },
            },
        },
    },
})

nvim_lsp.svelte.setup {} -- svelte

-- python
nvim_lsp.pylsp.setup {
    pylsp = {
        plugins = {
            ruff = {
                enabled = true,                  -- Enable the plugin
                formatEnabled = true,            -- Enable formatting using ruffs formatter
                extendSelect = { "I" },          -- Rules that are additionally used by ruff
                extendIgnore = { "C90" },        -- Rules that are additionally ignored by ruff
                format = { "I" },                -- Rules that are marked as fixable by ruff that should be fixed when running textDocument/formatting
                severities = { ["D212"] = "I" }, -- Optional table of rules where a custom severity is desired
                unsafeFixes = false,             -- Whether or not to offer unsafe fixes as code actions. Ignored with the "Fix All" action

                -- Rules that are ignored when a pyproject.toml or ruff.toml is present:
                lineLength = 88,                                 -- Line length to pass to ruff checking and formatting
                exclude = { "__about__.py" },                    -- Files to be excluded by ruff checking
                select = { "F" },                                -- Rules to be enabled by ruff
                ignore = { "D210" },                             -- Rules to be ignored by ruff
                perFileIgnores = { ["__init__.py"] = "CPY001" }, -- Rules that should be ignored for specific files
                preview = false,                                 -- Whether to enable the preview style linting and formatting.
                targetVersion = "py312",                         -- The minimum python version to target (applies for both linting and formatting).
            }
        }
    }
}
