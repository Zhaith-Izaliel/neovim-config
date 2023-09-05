local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').ltex.setup {
  capabilities = capabilities,
  settings = {
    ltex = {
      language = 'en-US',
      -- checkFrequency = 'save',
    },
  },
  handlers = {
    ['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = false,
      }
    ),
  }
}

