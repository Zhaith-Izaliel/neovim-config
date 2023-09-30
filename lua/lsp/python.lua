local capabilities = require('lsp.utils').capabilities

require('lspconfig').pyright.setup {
  capabilities = capabilities,
} -- Python

