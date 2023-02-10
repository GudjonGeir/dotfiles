-- Bind leader space bar as the leader key for vim.
vim.g.mapleader = ' '

-- Bind , as the local leader for specific filetypes.
vim.g.maplocalleader = ','

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme everforest]]

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.numberwidth = 4
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.wrap = false
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time for writing swap to disk (crash recovery)
vim.o.updatetime = 250

-- When to display the sign column
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- How many ":" commands to store
vim.o.history = 10000

-- time until mapped sequence completes (used by which-key)
vim.o.timeoutlen = 100

-- refresh buffers when edited outside vim
vim.o.autoread = true

-- inserts spaces when pressing <Tab> in insert mode
-- vim.o.expandtab = true

-- default tab behavior
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- blink matching bracket when inserting a new one
vim.o.showmatch = true

-- number of lines to keep visible above and below cursor when scrolling
vim.o.scrolloff = 5
