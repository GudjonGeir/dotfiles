local null_ls = require("null-ls")

local M = {}
M.setup = function(on_attach)
  null_ls.setup({
      sources = {
        -- typescript
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,


        -- golang
        null_ls.builtins.diagnostics.golangci_lint

        -- other
        -- null_ls.builtins.code_actions.refactoring
      },
      on_attach = on_attach,
  })
end

return M
