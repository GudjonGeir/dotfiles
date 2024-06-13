--Keybind hints
return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		require("which-key").setup()

		require("which-key").register({
			["<leader>"] = {
				b = {
					name = "+buffer",
				},
				c = {
					name = "+comments",
				},
				f = {
					name = "+files",
					e = {
						name = "+environment",
					},
					t = {
						name = "+tests",
					},
				},
				g = {
					name = "+git/version-control",
					t = {
						name = "+toggles",
					},
				},
				t = {
					name = "+tests",
				},
				T = {
					name = "+toggles",
				},
				s = {
					name = "+search",
				},
				w = {
					name = "+window",
				},
			},
			["<localleader>"] = {
				d = {
					name = "+diagnostics",
				},
				g = {
					name = "+goto",
				},
				s = {
					name = "+search",
				},
				r = {
					name = "+refactor",
				},
			},
		})
	end,
}
