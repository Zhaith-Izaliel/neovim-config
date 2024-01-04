local capabilities = require('lsp.utils').capabilities

-- Go
require('go').setup {
  lsp_cfg = {
    capabilities = capabilities,
    -- other setups
  },
}

