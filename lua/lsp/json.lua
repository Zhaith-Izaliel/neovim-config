local capabilities = require('lsp.utils').capabilities

require('lspconfig').jsonls.setup {
  capabilities = capabilities,
}

