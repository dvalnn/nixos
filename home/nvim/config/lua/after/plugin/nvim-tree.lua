local function opts(desc)
    return {
        desc = "nvim-tree: " .. desc,
        noremap = true,
        silent = true,
        nowait = true
    }
end

local function nvimTreeOpen()
    local api = require "nvim-tree.api"
    api.tree.toggle() -- open/focus the tree
end

local function custom_on_attach(bufnr)
    local api = require "nvim-tree.api"
    --default mappings
    api.config.mappings.default_on_attach(bufnr)
end

vim.keymap.set('n', '<leader>e', nvimTreeOpen, opts('Open/Focus Tree'))

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
