return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- optional, for file icons
	},
	config = function()
		require("nvim-tree").setup({})
		vim.keymap.set("n", "<leader>ftt", ":NvimTreeToggle<cr>", { silent = true })
		vim.keymap.set("n", "<leader>ftf", ":NvimTreeFindFile<cr>", { silent = true })
	end,
}
