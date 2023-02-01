local null_ls = require("null-ls")

local M = {}
M.setup = function(on_attach)
  null_ls.setup({
    debug = true,
    sources = {
      -- typescript
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.formatting.prettierd,


      -- golang
      null_ls.builtins.diagnostics.golangci_lint,

      -- postgres
      null_ls.builtins.formatting.sqlfluff.with({
        extra_args = {"--dialect", "postgres"}
      }),
      null_ls.builtins.diagnostics.sqlfluff.with({
        extra_args = {"--dialect", "postgres"}
      })

      -- other
      -- null_ls.builtins.code_actions.refactoring
    },
    on_attach = on_attach,
  })
  require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = true,
    automatic_setup = false,
  })
end

return M
