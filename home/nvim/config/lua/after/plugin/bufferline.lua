require("bufferline").setup {}

local function opts(desc)
    return { desc = "bufferline: " .. desc }
end

vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", opts("Toggle Pin"))
vim.keymap.set("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", opts("Delete Non-Pinned Buffers"))
vim.keymap.set("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", opts("Delete Other Buffers"))
vim.keymap.set("n", "<A-h>", "<cmd>BufferLineCyclePrev<cr>", opts("Prev Buffer"))
vim.keymap.set("n", "<A-l>", "<cmd>BufferLineCycleNext<cr>", opts("Next Buffer"))
vim.keymap.set("n", "<C-H>", "<cmd>BufferLineMovePrev<cr>", opts("Move buffer prev"))
vim.keymap.set("n", "<C-L>", "<cmd>BufferLineMoveNext<cr>", opts("Move buffer next"))
