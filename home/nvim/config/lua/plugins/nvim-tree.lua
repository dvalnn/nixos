-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function opts(desc)
    return {
        desc = "nvim-tree: " .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true
    }
end

local function nvimTreeOpen()
    local api = require "nvim-tree.api"
    api.tree.open() -- open/focus the tree
end

local function custom_on_attach(bufnr)
    local api = require "nvim-tree.api"
    --default mappings
    api.config.mappings.default_on_attach(bufnr)

    local function closeTree()
        if api.tree.is_tree_buf(bufnr) then
            api.tree.close()
        end
    end

    -- custom mappings for the buffer here or other options here
    vim.keymap.set('n', '<leader>E', closeTree, opts('Close Tree'))
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
