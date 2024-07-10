local o = vim.opt
local g = vim.g

vim.cmd.colorscheme("catppuccin")

-- leader
g.mapleader = ' '
g.maplocalleader = ' '

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Undo Files
o.undofile = true
o.undodir = "/home/dvalinn/.cache/"

-- Indentation
o.smartindent = true
o.autoindent = true
o.tabstop = 4
o.shiftwidth = 4
o.shiftround = true
o.expandtab = true
o.scrolloff = 3

-- Use system clipboard
o.clipboard = "unnamedplus"

-- Use mouse
o.mouse = "a"

-- Nicer UI
o.termguicolors = true
o.cursorline = true
o.number = true
o.relativenumber = true

-- Remove viminfo file
o.viminfo = ""
o.viminfofile = "NONE"

-- Misc Quality of Life
o.smartcase = true
o.timeoutlen = 3000
o.ttimeoutlen = 100
o.incsearch = true
o.hidden = true
o.shortmess = "atI"
o.wrap = false
o.swapfile = false
o.splitright = true
o.splitbelow = true
o.errorbells = false
