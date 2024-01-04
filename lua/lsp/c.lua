local capabilities = require('lsp.utils').capabilities

require('lspconfig').ccls.setup {
  capabilities = capabilities,
}-- C/C++

