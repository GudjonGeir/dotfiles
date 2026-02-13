-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require("lazy").setup({

	require("user.plugins.lsp"),
	require("user.plugins.lint"),
	-- require("user.plugins.nvim-cmp"),
	require("user.plugins.blink"),

	require("user.plugins.treesitter"),
	require("user.plugins.which-key"),
	require("user.plugins.telescope"),
	require("user.plugins.conform"),
	require("user.plugins.nvim-tree"),
	require("user.plugins.harpoon"),
	require("user.plugins.neotest"),

	require("user.plugins.colorizer"),
	require("user.plugins.indent-blankline"),

	--  AI
	-- "github/copilot.vim",
	require("user.plugins.copilot"),
	-- require("user.plugins.avante"),

	"christoomey/vim-tmux-navigator",
	"tpope/vim-commentary",
	"qpkorr/vim-bufkill",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	--   use 'editorconfig/editorconfig-vim'
	"voldikss/vim-floaterm",
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	require("user.plugins.markdown-preview"),

	--   -- Git related plugins
	--   use 'tpope/vim-rhubarb'
	{ "lewis6991/gitsigns.nvim", opts = {} },
	require("user.plugins.diffview"),

	--   -- Status and buffer lines
	require("user.plugins.lualine"),
	{ "akinsho/bufferline.nvim", opts = {} },

	--   -- Colorschemes
	require("user.themes.everforest"),
	--   use 'arcticicestudio/nord-vim'
	--   use 'navarasu/onedark.nvim'
	--   use 'ayu-theme/ayu-vim'
	--   use 'flrnd/plastic.vim'
	--   use 'gryf/wombat256grf'
	--   use 'sainnhe/edge'
})
