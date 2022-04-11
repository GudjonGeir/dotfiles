local lspconfig = require("lspconfig")

local M = {}
M.setup = function(on_attach, capabilities)
  lspconfig.tsserver.setup({
      on_attach = function(client, bufnr)
          -- disable built in formatting to prevent conflict with prettier
          client.resolved_capabilities.document_formatting = false
          client.resolved_capabilities.document_range_formatting = false

          _G.lsp_organize_imports = function()
              local params = {
                  command = "_typescript.organizeImports",
                  arguments = {vim.api.nvim_buf_get_name(0)},
                  title = ""
              }
              vim.lsp.buf.execute_command(params)
          end
          vim.cmd("command! LspOrganize lua lsp_organize_imports()")

          on_attach(client, bufnr)
      end,
  })
end

return M
