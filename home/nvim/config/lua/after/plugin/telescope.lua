require('telescope').setup = function()
    local actions = require "telescope.actions"
    return {
        mappings = {
            i = {
                ["<C-Down>"] = actions.cycle_history_next,
                ["<C-Up>"] = actions.cycle_history_prev,
                ["<C-f>"] = actions.preview_scrolling_down,
                ["<C-b>"] = actions.preview_scrolling_up,
            },
            n = {
                ["q"] = actions.close,
            },
        }
    }
end

local function opts(desc)
    return { desc = "Telescope: " .. desc }
end

local builtin = require "telescope.builtin"
vim.keymap.set('n', '<leader><space>', builtin.find_files, opts("Find files (root dir)"))
vim.keymap.set('n', '<leader>fg', builtin.git_files, opts("Find git files"))
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts("Find buffers"))
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})

require('telescope').load_extension('fzf')
require('dressing').setup{}


