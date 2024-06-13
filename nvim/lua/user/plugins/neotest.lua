return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",

		"nvim-neotest/neotest-go",
	},
	keys = {
		{
			"<leader>tt",
			function()
				require("neotest").run.run()
			end,
			mode = "n",
			desc = "Run test",
		},
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			mode = "n",
			desc = "Run test file",
		},
		{
			"<leader>tp",
			function()
				require("neotest").run.run(vim.fn.getcwd())
			end,
			mode = "n",
			desc = "Run test project",
		},
		{
			"<leader>to",
			function()
				require("neotest").summary.toggle()
			end,
			mode = "n",
			desc = "Toggle test output",
		},
		{
			"<leader>tn",
			function()
				require("neotest").jump.next({ status = "failed" })
				require("neotest").output.open()
			end,
			mode = "n",
			desc = "Jump to next test",
		},
		{
			"<leader>tp",
			function()
				require("neotest").jump.prev({ status = "failed" })
				require("neotest").output.open()
			end,
			mode = "n",
			desc = "Jump to previous test",
		},
		{
			"<leader>tl",
			function()
				require("neotest").output.open()
			end,
			mode = "n",
			desc = "Open last error",
		},
		-- nnoremap <silent>[n <cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>
		-- nnoremap <silent>]n <cmd>lua require("neotest").jump.next({ status = "failed" })<CR>
	},
	-- opts = {
	-- 	-- your neotest config here
	-- 	adapters = {
	-- 		require("neotest-go"),
	-- 	},
	-- },
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("neotest").setup({
			-- your neotest config here
			adapters = {
				require("neotest-go")({
					recursive_run = true,
				}),
			},
		})
	end,
}
