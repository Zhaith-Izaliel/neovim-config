local capabilities = require('lsp.utils').capabilities

require('lspconfig').html.setup {
  capabilities = capabilities,
} -- HTML

