local capabilities = require('lsp.utils').capabilities

require('lspconfig').omnisharp.setup {
  capabilities = capabilities,
  cmd = { 'dotnet', omnisharp_path },
}

