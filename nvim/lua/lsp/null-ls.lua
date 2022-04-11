local null_ls = require("null-ls")

local M = {}
M.setup = function(on_attach)
  null_ls.setup({
      sources = {
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.code_actions.eslint,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.code_actions.gitsigns,
      },
      on_attach = on_attach,
  })
end

return M
