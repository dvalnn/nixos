local o = vim.opt
local g = vim.g

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Undo Files
o.swapfile = false
o.backup = false
o.undofile = true
o.undodir = "/home/dvalinn/.cache/"

-- Indentation
o.smartindent = true
o.autoindent = true
o.tabstop = 4
o.shiftwidth = 4
o.shiftround = true
o.expandtab = true

-- Use system clipboard
o.clipboard = "unnamedplus"

-- Use mouse
o.mouse = "a"

-- Nicer UI
o.termguicolors = true
o.cursorline = true
o.number = true
o.relativenumber = true
o.scrolloff = 8
-- o.colorcolumn = "80"
o.signcolumn = "yes"
o.background = "dark"

-- Remove viminfo file
-- o.viminfo = ""
-- o.viminfofile = "NONE"

--search
o.hlsearch = false
o.incsearch = true

-- Misc Quality of Life
o.smartcase = true
o.timeoutlen = 3000
o.ttimeoutlen = 100
o.hidden = true
o.shortmess = "atI"
o.wrap = false
o.splitright = true
o.splitbelow = true
o.errorbells = false
o.updatetime = 50
