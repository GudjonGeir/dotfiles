local lspconfig = require("lspconfig")

local lsp_organize_imports = function()
    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end

local M = {}
M.setup = function(on_attach, capabilities)
    lspconfig.tsserver.setup({
         init_options = { 
            preferences = { 
              -- other preferences... 
              importModuleSpecifierPreference = 'project-relative', 
              importModuleSpecifierEnding = 'minimal', 
            },  
        },
        on_attach = function(client, bufnr)
            -- disable built in formatting to prevent conflict with prettier
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false


            vim.keymap.set('n', '<localleader>ro', lsp_organize_imports,
                { buffer = bufnr, desc = "Organize Imports", silent = true })
            on_attach(client, bufnr)
        end,
        capabilities = capabilities
    })
end

return M
