return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
	keys = {
		{
			"<leader>gD",
			function()
				local handle = io.popen("git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null")
				local result = handle and handle:read("*a") or ""
				if handle then
					handle:close()
				end
				local branch = result:match("refs/remotes/origin/(.+)") or "main"
				branch = branch:gsub("%s+$", "")
				vim.cmd("DiffviewOpen " .. branch .. "...HEAD")
			end,
			desc = "Diff against default branch",
		},
		{ "<leader>gQ", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
		{ "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "File history (current)" },
	},
	opts = {},
}
