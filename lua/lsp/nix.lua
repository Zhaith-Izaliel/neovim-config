local capabilities = require('lsp.utils').capabilities

require('lspconfig').nil_ls.setup {
  capabilities = capabilities,
}

