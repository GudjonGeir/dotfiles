return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		-- {
		-- 	"nvim-treesitter/nvim-treesitter",
		-- 	branch = "main",
		-- },

		{
			"fredrikaverpil/neotest-golang",
			version = "*",
			-- dependencies = {
			-- 	"andythigpen/nvim-coverage",
			-- },
			build = function()
				vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
			end,
		},
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
			"<leader>tP",
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
		local neotest_golang_opts = {
			runner = "go",
			go_test_args = {
				"-timeout=3s",
				-- "-v",
				-- "-race",
				-- "-count=1",
				-- "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
			},
		}
		require("neotest").setup({
			adapters = {
				require("neotest-golang")(neotest_golang_opts),
			},
		})
	end,
}
