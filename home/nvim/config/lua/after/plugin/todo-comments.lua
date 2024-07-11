require "todo-comments".setup{}

vim.keymap.set('n', '<leader>tt', vim.cmd.TodoTelescope)
vim.keymap.set('n', '<leader>tf', vim.cmd.TodoQuickFix)
