local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').ltex.setup {
  capabilities = capabilities,
  settings = {
    ltex = {
      language = 'en-US',
      ['ltex-ls'] = {
        logLevel = "info",
      },
    },
  },
}

