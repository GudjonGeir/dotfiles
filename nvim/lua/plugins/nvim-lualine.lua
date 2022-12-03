local nvim_tree = { sections = { lualine_a = { "filetype" } }, filetypes = { "NvimTree" } }
require("lualine").setup({
  options = {
    theme = "auto"
  },
  extensions = { nvim_tree }
})

