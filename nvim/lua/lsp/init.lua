-- sets the mode, buffer and description for us each time.
local buf_map = function(bufnr, keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, silent = true })
end

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = 'rounded',
    close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
  }
)


local on_attach = function(client, bufnr)
  -- require "lsp_signature".on_attach()

  -- goto bindings
  buf_map(bufnr, '<localleader>gg', vim.lsp.buf.definition, "Goto definition")
  buf_map(bufnr, '<localleader>gr', require('telescope.builtin').lsp_references, "Goto references")
  buf_map(bufnr, '<localleader>gR', vim.lsp.buf.references, "Open reference list")
  buf_map(bufnr, '<localleader>gi', require('telescope.builtin').lsp_implementations, "Goto implementation")
  buf_map(bufnr, '<localleader>gI', vim.lsp.buf.implementation, "Open implementation list")
  buf_map(bufnr, '<localleader>ht', vim.lsp.buf.type_definition, "Goto type definition")

  -- help and info bindings
  buf_map(bufnr, '<localleader>hh', vim.lsp.buf.hover, "")
  buf_map(bufnr, '<localleader>hs', vim.lsp.buf.signature_help, 'Signature Documentation')
  vim.keymap.set({ 'n', 'i' }, '<C-s>', vim.lsp.buf.signature_help,
    { desc = 'Signature Documentation', silent = true, buffer = bufnr })
  buf_map(bufnr, '<leader>sd', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  buf_map(bufnr, '<leader>sw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')


  -- refactor bindings
  buf_map(bufnr, '<localleader>rr', vim.lsp.buf.rename, "")
  -- buf_map(bufnr, '<localleader>ro', ":LspOrganize<CR>", "")

  buf_map(bufnr, '<localleader>dp', vim.diagnostic.goto_prev, "")
  buf_map(bufnr, '<localleader>dn', vim.diagnostic.goto_next, "")
  buf_map(bufnr, '<localleader>dl', vim.diagnostic.open_float, "")
  buf_map(bufnr, '<localleader>dd', ':TroubleToggle<cr>', "")

  buf_map(bufnr, '<localleader>a', vim.lsp.buf.code_action, "")

  buf_map(bufnr, '<localleader>=', function() vim.lsp.buf.format({ async = true }) end, "")

  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
end


-- Setup neovim lua configuration
require('neodev').setup()


-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


-- Setup mason so it can manage external tooling
require('mason').setup()

-- Configure linters and formatters
require("lsp.null-ls").setup(on_attach)

local servers = {
  'gopls',
  'jsonnet_ls',
  'tsserver',
  -- 'sumneko_lua',
}

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = servers,
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end,
  ["tsserver"] = function()
    require("lsp.tsserver").setup(on_attach, capabilities)
  end,
}
