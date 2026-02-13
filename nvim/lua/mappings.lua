vim.keymap.set("v", "<leader>y", '"+y<cr>', { silent = true })

vim.keymap.set("n", "<leader>bd", ":BD<cr>", { silent = true })
vim.keymap.set("n", "<leader>bf", ":bfirst<cr>", { silent = true })
vim.keymap.set("n", "<leader>bl", ":blast<cr>", { silent = true })
vim.keymap.set("n", "<leader>bn", ":bn<cr>", { silent = true })
vim.keymap.set("n", "<leader>bp", ":bp<cr>", { silent = true })
vim.keymap.set("n", "<leader>bx", ":%bd|e#|bd#<cr>", { silent = true })
--
-- TODO:, convert to lua, use gitsigns onAttach
vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", { silent = true })
vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<cr>", { silent = true })
vim.keymap.set(
	"n",
	"<leader>gg",
	":FloatermNew --height=0.9 --width=0.8 --title=lazygit lazygit<cr>",
	{ silent = true }
)
vim.keymap.set("n", "<leader>gtt", ":Gitsigns toggle_signs<cr>", { silent = true })
vim.keymap.set("n", "<leader>gtb", ":Gitsigns toggle_current_line_blame<cr>", { silent = true })
vim.keymap.set("n", "<leader>gP", ":Gitsigns preview_hunk<cr>", { silent = true })
vim.keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk<cr>", { silent = true })
vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<cr>", { silent = true })
vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<cr>", { silent = true })
vim.keymap.set("v", "<leader>gs", ":Gitsigns stage_hunk<cr>", { silent = true })
vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<cr>", { silent = true })
vim.keymap.set("n", "<leader>gR", ":Gitsigns reset_hunk<cr>", { silent = true })
vim.keymap.set("v", "<leader>gR", ":Gitsigns reset_hunk<cr>", { silent = true })

vim.keymap.set("n", "<leader>cl", "<Plug>CommentaryLine", { silent = true })
vim.keymap.set("v", "<leader>cl", "<Plug>Commentary", { silent = true })
vim.keymap.set("n", "<leader>cp", "gcip<cr>", { silent = true })

vim.keymap.set("n", "<leader>wsh", ":sp<cr>", { silent = true })
vim.keymap.set("n", "<leader>wsv", ":vsp<cr>", { silent = true })
vim.keymap.set("n", "<leader>wc", "<C-w>c<cr>", { silent = true })
vim.keymap.set("n", "<leader>wo", "<C-w>o<cr>", { silent = true })
vim.keymap.set("n", "<leader>wmu", "<C-w>K<cr>", { silent = true })
vim.keymap.set("n", "<leader>wmd", "<C-w>J<cr>", { silent = true })
vim.keymap.set("n", "<leader>wml", "<C-w>H<cr>", { silent = true })
vim.keymap.set("n", "<leader>wmr", "<C-w>L<cr>", { silent = true })

vim.keymap.set("n", "<leader>fee", ":vsplit $MYVIMRC<cr>", { silent = true })
vim.keymap.set("n", "<leader>fer", ":source $MYVIMRC<cr>", { silent = true })
vim.keymap.set("n", "<leader>fes", ":source $MYVIMRC<cr>", { silent = true })

-- Yank file path with line number
vim.keymap.set("n", "<leader>yl", function()
	local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
	local line = vim.fn.line(".")
	local ref = path .. ":" .. line
	vim.fn.setreg("+", ref)
	vim.notify("Yanked: " .. ref)
end, { desc = "Yank file:line reference" })

vim.keymap.set("v", "<leader>yl", function()
	local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
	local start_line = vim.fn.line("v")
	local end_line = vim.fn.line(".")
	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end
	local ref = path .. ":" .. start_line .. "-" .. end_line
	vim.fn.setreg("+", ref)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
	vim.notify("Yanked: " .. ref)
end, { desc = "Yank file:line-range reference" })

vim.keymap.set("n", "<leader>Tr", ":set relativenumber!<cr>", { silent = true })
vim.keymap.set("n", "<leader>Tn", ":set number!<cr>", { silent = true })
