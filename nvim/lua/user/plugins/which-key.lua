--Keybind hints
return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		require("which-key").setup()

		require("which-key").add({
			{ "<leader>b", group = "+buffer" },
			{ "<leader>c", group = "+comments" },

			{ "<leader>f", group = "+files" },
			{ "<leader>fe", group = "+environment" },
			{ "<leader>ft", group = "+toggles" },

			{ "<leader>g", group = "+git/version-control" },
			{ "<leader>gt", group = "+toggles" },

			{ "<leader>t", group = "+tests" },
			{ "<leader>T", group = "+toggles" },
			{ "<leader>s", group = "+search" },
			{ "<leader>w", group = "+window" },

			{ "<localleader>d", group = "+diagnostics" },
			{ "<localleader>g", group = "+goto" },
			{ "<localleader>s", group = "+search" },
			{ "<localleader>r", group = "+refactor" },
		})
	end,
}
