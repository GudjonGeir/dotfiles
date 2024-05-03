return {
	"lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
	main = "ibl",
	opts = {
		indent = { char = "┊" },
		whitespace = {
			remove_blankline_trail = true,
		},
	},
}
