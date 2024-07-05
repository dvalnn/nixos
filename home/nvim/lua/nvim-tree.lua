-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function custom_on_attach(bufnr)

    local api = require "nvim-tree.api"

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
    end

    --default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<leader>e', api.tree.open, opts('Open/Focus'))
    vim.keymap.set('n', '<leader>E', api.tree.close, opts('Close'))

end

require("nvim-tree").setup({
    disable_netrw = true,

    view = {
        side = "right",
    },

    sort = {
        sorter = "case_sensitive",
    },

    renderer = {
        group_empty = true,
    },

    on_attach = custom_on_attach,
})
