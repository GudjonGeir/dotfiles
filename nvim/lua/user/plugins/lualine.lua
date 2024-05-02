local nvim_tree = { sections = { lualine_a = { "filetype" } }, filetypes = { "NvimTree" } }
return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "auto",
		},
		extensions = { nvim_tree },
	},
}
