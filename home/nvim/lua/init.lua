local opts = vim.opt
local g = vim.g

g.mapleader = ' '

-- Undo Files
opt.undofile = true
opt.undodir = "/home/dvalinn/.cache/"

-- Indentation
opt.smartindent = true
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Use system clipboard
opt.clipboard = "unnamedplus"

-- Use mouse
opt.mouse = "a"

-- Nicer UI
opt.termguicolors = true
opt.cursorline = true
opt.number = true

-- Remove viminfo file
opt.viminfo = ""
opt.viminfofile = "NONE"

-- Misc Quality of Life
opt.smartcase = true
opt.ttimeoutlen = 5
opt.compatible = true
opt.incsearch = true
opt.hidden = true
opt.shortmess = "atI"
