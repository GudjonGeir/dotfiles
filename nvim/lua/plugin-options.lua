--------------------- bufferline ---------------------
require("bufferline").setup({})


--------------------- gitsigns ---------------------
require('gitsigns').setup()


--------------------- colorizer ---------------------
require("colorizer").setup({}, {
  RRGGBBAA = true
})


--------------------- nvim-tree ---------------------
require("nvim-tree").setup()


--------------------- lualine ---------------------
local nvim_tree = { sections = { lualine_a = { "filetype" } }, filetypes = { "NvimTree" } }
require("lualine").setup({
  options = {
    theme = "auto"
  },
  extensions = { nvim_tree }
})


--------------------- telescope ---------------------
require('telescope').load_extension('fzf')


--------------------- which-key ---------------------
local wk = require("which-key")
wk.setup {}
wk.register({
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
        name = "+tree"
      },
    },
    g = {
      name = "+git/version-control",
      t = {
        name = "+toggles"
      },
    },
    t = {
      name = "+tests",
    },
    T = {
      name = "+toogles",
    },
    w = {
      name = "+window",
    },
  },
  ["<localleader>"] = {
    g = {
      name = "+goto",
    },
  },
})


--------------------- indent_blankline ---------------------
require('ibl').setup {
  indent = { char = '┊' },
  whitespace = {
    remove_blankline_trail = true,
  },
}

--------------------- nvim-treesitter ---------------------
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    'css',
    'go',
    'graphql',
    'help',
    'html',
    'javascript',
    'jsonnet',
    'lua',
    'python',
    'rust',
    'scss',
    'sql',
    'tsx',
    'typescript',
    'vim',
  },

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    -- swap = {
    --   enable = true,
    --   swap_next = {
    --     ['<leader>a'] = '@parameter.inner',
    --   },
    --   swap_previous = {
    --     ['<leader>A'] = '@parameter.inner',
    --   },
    -- },
  },
}


--------------------- nvim-cmp ---------------------
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    -- ['<down>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
    -- ['<up>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
}



--------------------- harpoon ---------------------
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon add" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<A-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<A-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<A-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<A-l>", function() ui.nav_file(4) end)
