require("persistence").setup{
    event = "BufReadPre",
    options = vim.opt.sessionoptions:get()
}

local function opts(desc)
    return {desc = "Persistence: " .. desc}
end

-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, opts("Load session for cwd"))

-- select a session to load
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end, opts("Select session to load"))

-- load the last session
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, opts("Load last session"))

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, opts("Dont save current session"))
