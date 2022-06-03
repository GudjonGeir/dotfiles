source ~/.config/nvim/plugins.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/mnemonics.vim

lua require("lsp")
lua require("plugins.nvim-tree")
lua require("plugins.gitsigns")
lua require("plugins.compe")
lua require("plugins.which-key")
