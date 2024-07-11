local function opts(desc)
    return {
        desc = "nvim-tree: " .. desc,
        noremap = true,
        silent = true,
        nowait = true
    }
end

local function custom_on_attach(bufnr)
    local api = require "nvim-tree.api"
    --default mappings
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set('n', 'R', vim.cmd.NvimTreeRefresh, opts('Refresh'))
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

local function nvimTreeOpen()
    local api = require "nvim-tree.api"
    api.tree.toggle() -- open/focus the tree
end

vim.keymap.set('n', '<leader>e', nvimTreeOpen, opts("Toggle"))
