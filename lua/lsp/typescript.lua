local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Typescript
require('typescript-tools').setup {
  capabilities = capabilities,

}

