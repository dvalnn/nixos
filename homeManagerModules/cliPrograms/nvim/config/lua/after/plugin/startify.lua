local g = vim.g

g.startify_custom_header = 'startify#center(startify#fortune#cowsay())'

local function opts(desc)
    return {desc = "Startify: " .. desc}
end

vim.keymap.set("n", "<leader>ss", "<cmd>SSave<cr>", opts("Save Session"))
vim.keymap.set("n", "<leader>sd", "<cmd>SDelete<cr>", opts("Delete Session"))
vim.keymap.set("n", "<leader>sc", "<cmd>SClose<cr>", opts("Close Session"))
vim.keymap.set("n", "<leader>sl", "<cmd>SLoad<cr>", opts("Load Session"))
