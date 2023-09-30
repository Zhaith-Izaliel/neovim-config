local capabilities = require('lsp.utils').capabilities

require('lspconfig').bashls.setup {
  capabilities = capabilities,
}

