-- Source: https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
-- inspo: https://github.com/lucax88x/configs/tree/master/dotfiles/.config/nvim/lua/lt/lsp
-- TODO: Make more generic for easier config of new languages
local nvim_lsp = require("lspconfig")
vim.lsp.set_log_level("debug")

-- local format_async = function(err, _, result, _, bufnr)
--     if err ~= nil or result == nil then return end
--     if not vim.api.nvim_buf_get_option(bufnr, "modified") then
--         local view = vim.fn.winsaveview()
--         vim.lsp.util.apply_text_edits(result, bufnr)
--         vim.fn.winrestview(view)
--         if bufnr == vim.api.nvim_get_current_buf() then
--             vim.api.nvim_command("noautocmd :update")
--         end
--     end
-- end

-- vim.lsp.handlers["textDocument/formatting"] = format_async

_G.lsp_organize_imports = function()
    local params = {
        command = "_typescript.organizeImports",
        arguments = {vim.api.nvim_buf_get_name(0)},
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end

local on_attach = function(client, bufnr)
    local buf_map = vim.api.nvim_buf_set_keymap
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspOrganize lua lsp_organize_imports()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
    -- goto bindings
    buf_map(bufnr, "n", "<localleader>gg", ":LspDef<CR>", {silent = true})
    buf_map(bufnr, "n", "<localleader>gr", ":LspRefs<CR>", {silent = true})
    -- help and info bindings
    buf_map(bufnr, "n", "<localleader>hd", ":LspTypeDef<CR>", {silent = true})
    buf_map(bufnr, "n", "<localleader>hh", ":LspHover<CR>", {silent = true})
    -- refactor bindings
    buf_map(bufnr, "n", "<localleader>rr", ":LspRename<CR>", {silent = true})
    buf_map(bufnr, "n", "<localleader>ro", ":LspOrganize<CR>", {silent = true})

    buf_map(bufnr, "n", "<localleader>dp", ":LspDiagPrev<CR>", {silent = true})
    buf_map(bufnr, "n", "<localleader>dn", ":LspDiagNext<CR>", {silent = true})
    buf_map(bufnr, "n", "<localleader>dl", ":LspDiagLine<CR>", {silent = true})

    buf_map(bufnr, "n", "<localleader>a", ":LspCodeAction<CR>", {silent = true})

    buf_map(bufnr, "n", "<localleader>=", ":LspFormatting<CR>", {silent = true})

    -- TODO: error navigation

    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>",
              {silent = true})
    -- if client.resolved_capabilities.document_formatting then
    --     vim.api.nvim_exec([[
    --      augroup LspAutocommands
    --          autocmd! * <buffer>
    --          autocmd BufWritePre <buffer> LspFormatting
    --      augroup END
    --      ]], true)
    -- end
end

nvim_lsp.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end
}

-- TODO: functions file

-- Check if the file in the filepath exist
-- @param name string
-- @return boolean
local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

-- Get the node executable if it exists
-- in node_modeles, else use the global executable
-- @param command string
-- @return string
local function get_node_executable(command)
  local buffer_directory = vim.fn.expand('%:p:h')
  local current_directory = buffer_directory 
  while(true)
  do
    if current_directory == '/' then return command end

    local project_command = current_directory .. '/node_modules/.bin/' .. command
    if file_exists(project_command) == true then
      return project_command
    end

    current_directory, count = string.gsub(current_directory, "/[%a%d]+$", "")

    if count < 1 then return command end
  end
end

 local filetypes = {
     typescript = "eslint",
     typescriptreact = "eslint",
 }

 local linters = {
     eslint = {
         sourceName = "eslint",
         command = "eslint_d",
         rootPatterns = {".eslintrc.js", "package.json"},
         debounce = 100,
         args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
         parseJson = {
             errorsRoot = "[0].messages",
             line = "line",
             column = "column",
             endLine = "endLine",
             endColumn = "endColumn",
             message = "${message} [${ruleId}]",
             security = "severity"
         },
         securities = {[2] = "error", [1] = "warning"}
     }
 }

 local formatters = {
     prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
 }

 local formatFiletypes = {
     typescript = "prettier",
     typescriptreact = "prettier"
 }

 nvim_lsp.diagnosticls.setup {
     on_attach = on_attach,
     filetypes = vim.tbl_keys(filetypes),
     init_options = {
         filetypes = filetypes,
         linters = linters,
         formatters = formatters,
         formatFiletypes = formatFiletypes
     }
 }


-- local prettier = {
--   formatCommand = "prettier --stdin --stdin-filepath ${INPUT}",
--   formatStdin = true
-- }

-- local eslint = {
--   lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
--   -- lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
--   lintIgnoreExitCode = true,
--   lintStdin = true,
--   lintFormats = {"%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m"},
--   -- formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
--   -- formatStdin = true
-- }

-- nvim_lsp.efm.setup {
--     filetypes = {"typescript", "typescriptreact"},
--     init_options = {documentFormatting = true},
--     root_dir = function(fname)
--         local cwd = nvim_lsp.util.root_pattern("tsconfig.json")(fname) or
--                     nvim_lsp.util.root_pattern(".eslintrc.json", ".git")(fname) or
--                     nvim_lsp.util.root_pattern("package.json", ".git/", ".zshrc")(fname);
--         return cwd
--     end,
--     settings = {
--         rootMarkers = {".git/"},
--         languages = {
--             typescript = {formatter, linter},
--             typescriptreact = {formatter, linter},
--         }
--     }
-- }


require"compe".setup {
    preselect = "always",
    source = {
        path = true,
        buffer = true,
        vsnip = true,
        nvim_lsp = true,
        nvim_lua = true
    }
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return vim.fn["compe#confirm"]()
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t("<Plug>(vsnip-expand-or-jump)")
    else
        return t("<Tab>")
    end
end

-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()",
                        {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<CR>", [[compe#confirm("<CR>")]],
                        {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-e>", [[compe#close("<C-e>")]],
                        {expr = true, silent = true})
