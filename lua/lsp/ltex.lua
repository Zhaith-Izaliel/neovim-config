local capabilities = require('lsp.utils').capabilities

require('lspconfig').ltex.setup {
  capabilities = capabilities,
  settings = {
    ltex = {
      language = 'en-US',
      checkFrequency = 'save',
    },
  },
}

