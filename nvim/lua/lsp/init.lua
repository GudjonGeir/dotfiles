local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end


local on_attach = function(client, bufnr)
  require "lsp_signature".on_attach()


  vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspOrganize lua lsp_organize_imports()")
  vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
  vim.cmd("command! LspRefsFzf lua builtin.lsp_references()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
  vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
  vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
  vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
  -- goto bindings
  buf_map(bufnr, "n", "<localleader>gg", ":LspDef<CR>", {silent = true})
  buf_map(bufnr, "n", "<localleader>gr", ":LspRefs<CR>", {silent = true})
  buf_map(bufnr, "n", "<localleader>gR", ":Telescope lsp_references<CR>", {silent = true})
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

  if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

for _, server in ipairs({
  "gopls",
  "null-ls",
  "tsserver",
}) do
  require("lsp." .. server).setup(on_attach, capabilities)
end
