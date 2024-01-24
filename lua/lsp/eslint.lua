local capabilities = require('lsp.utils').capabilities


require('lspconfig').eslint.setup { -- JS/TS
  capabilities = capabilities,
  -- cmd = { 'eslint_d', '--fix-to-stdout', '--stdin', '--stdin-filename', '$FILENAME' },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      command = 'EslintFixAll',
    })
  end,
}
