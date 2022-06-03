local null_ls = require("null-ls")

local M = {}
M.setup = function(on_attach)
  null_ls.setup({
      sources = {
        -- typescript
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.prettierd,


        -- golang
        null_ls.builtins.diagnostics.golangci_lint

        -- other
        -- null_ls.builtins.code_actions.refactoring
      },
      on_attach = on_attach,
  })
end

return M
