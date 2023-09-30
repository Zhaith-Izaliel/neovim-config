local capabilities = require('lsp.utils').capabilities

require('lspconfig').cmake.setup {
  capabilities = capabilities
} -- CMake

