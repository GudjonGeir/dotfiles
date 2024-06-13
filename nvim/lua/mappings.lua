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

vim.keymap.set("n", "<leader>Tr", ":set relativenumber!<cr>", { silent = true })
vim.keymap.set("n", "<leader>Tn", ":set number!<cr>", { silent = true })
